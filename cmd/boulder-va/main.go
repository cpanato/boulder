// Copyright 2014 ISRG.  All rights reserved
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

package main

import (
	"github.com/letsencrypt/boulder/Godeps/_workspace/src/github.com/streadway/amqp"
	"log"
	"time"

	"github.com/letsencrypt/boulder/cmd"
	blog "github.com/letsencrypt/boulder/log"
	"github.com/letsencrypt/boulder/rpc"
	"github.com/letsencrypt/boulder/va"
)

func main() {
	app := cmd.NewAppShell("boulder-va")
	app.Action = func(c cmd.Config) {
		// Set up logging
		auditlogger, err := blog.Dial(c.Syslog.Network, c.Syslog.Server, c.Syslog.Tag)
		cmd.FailOnError(err, "Could not connect to Syslog")

		vai := va.NewValidationAuthorityImpl(auditlogger, c.CA.TestMode)

		for true {
			ch := cmd.AmqpChannel(c.AMQP.Server)
			closeChan := ch.NotifyClose(make(chan *amqp.Error, 1))

			rac, err := rpc.NewRegistrationAuthorityClient(c.AMQP.RA.Client, c.AMQP.RA.Server, ch)
			cmd.FailOnError(err, "Unable to create RA client")

			vai.RA = &rac

			vas, err := rpc.NewValidationAuthorityServer(c.AMQP.VA.Server, ch, &vai)
			cmd.FailOnError(err, "Unable to create VA server")

			forever := make(chan bool)
			go func() {
				for err := range closeChan {
					log.Printf(" [!] AMQP Channel closed: [%s]", err)
					time.Sleep(time.Second*10)
					log.Printf(" [!] Reconnecting to AMQP...")
					close(forever)
					return
				}
			}()
			cmd.MaybeRunForever(vas, forever)
		}
	}

	app.Run()
}
