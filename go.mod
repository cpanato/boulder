module github.com/letsencrypt/boulder

go 1.17

require (
	github.com/beeker1121/goque v1.0.3-0.20191103205551-d618510128af
	github.com/eggsampler/acme/v3 v3.2.1
	github.com/go-gorp/gorp/v3 v3.0.2
	github.com/go-redis/redis/v8 v8.11.4
	github.com/go-sql-driver/mysql v1.5.0
	github.com/golang/groupcache v0.0.0-20210331224755-41bb18bfe9da
	github.com/google/certificate-transparency-go v1.0.22-0.20181127102053-c25855a82c75
	github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0
	github.com/honeycombio/beeline-go v1.1.1
	github.com/hpcloud/tail v1.0.0
	github.com/jmhodges/clock v0.0.0-20160418191101-880ee4c33548
	github.com/letsencrypt/challtestsrv v1.2.1
	github.com/letsencrypt/pkcs11key/v4 v4.0.0
	github.com/miekg/dns v1.1.45
	github.com/miekg/pkcs11 v1.1.1
	github.com/prometheus/client_golang v1.12.1
	github.com/prometheus/client_model v0.2.0
	github.com/titanous/rocacheck v0.0.0-20171023193734-afe73141d399
	github.com/weppos/publicsuffix-go v0.15.1-0.20220329081811-9a40b608a236
	github.com/zmap/zcrypto v0.0.0-20210811211718-6f9bc4aff20f
	github.com/zmap/zlint/v3 v3.3.1-0.20211019173530-cb17369b4628
	golang.org/x/crypto v0.17.0
	golang.org/x/net v0.10.0
	golang.org/x/text v0.14.0
	google.golang.org/grpc v1.56.3
	google.golang.org/protobuf v1.30.0
	gopkg.in/square/go-jose.v2 v2.4.1
	gopkg.in/yaml.v2 v2.4.0
)

require (
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/dgryski/go-rendezvous v0.0.0-20200823014737-9f7001d12a5f // indirect
	github.com/facebookgo/clock v0.0.0-20150410010913-600d898af40a // indirect
	github.com/facebookgo/limitgroup v0.0.0-20150612190941-6abd8d71ec01 // indirect
	github.com/facebookgo/muster v0.0.0-20150708232844-fd3d7953fd52 // indirect
	github.com/felixge/httpsnoop v1.0.1 // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/golang/snappy v0.0.0-20180518054509-2e65f85255db // indirect
	github.com/honeycombio/libhoney-go v1.15.2 // indirect
	github.com/klauspost/compress v1.11.4 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.1 // indirect
	github.com/prometheus/common v0.32.1 // indirect
	github.com/prometheus/procfs v0.7.3 // indirect
	github.com/syndtr/goleveldb v1.0.0 // indirect
	github.com/vmihailenco/msgpack/v4 v4.3.12 // indirect
	github.com/vmihailenco/tagparser v0.1.1 // indirect
	go.opentelemetry.io/contrib/propagators v0.19.0 // indirect
	go.opentelemetry.io/otel v0.19.0 // indirect
	go.opentelemetry.io/otel/trace v0.19.0 // indirect
	golang.org/x/mod v0.8.0 // indirect
	golang.org/x/sys v0.15.0 // indirect
	golang.org/x/tools v0.6.0 // indirect
	google.golang.org/appengine v1.6.7 // indirect
	google.golang.org/genproto v0.0.0-20230410155749-daa745c078e1 // indirect
	gopkg.in/alexcesaro/statsd.v2 v2.0.0 // indirect
	gopkg.in/fsnotify.v1 v1.4.7 // indirect
	gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7 // indirect
)

// This version is required by parts of the honeycombio/beeline-go package
// that we do not rely upon. It appears to introduce performance regressions
// for us.
exclude github.com/go-sql-driver/mysql v1.6.0
