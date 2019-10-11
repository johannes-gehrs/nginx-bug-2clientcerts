.PHONY: create-ca
create-ca:
	openssl genrsa -out ca.key 4096

.PHONY: create-cacert
create-cacert:
	openssl req -subj "/C=GB/CN=foo" -passin pass:$(pass) -new -x509 -days 365 -key ca.key -out ca.crt

.PHONY: create-clientcert1
create-clientcert1:
	openssl genrsa -out client1.key 4096
	openssl req -subj "/C=GB/CN=foo" -passin pass:$(pass) -new -x509 -days 365 -key client1.key -out client1.crt

.PHONY: create-clientcert1
create-clientcert2:
	openssl genrsa -out client2.key 4096
	openssl req -subj "/C=GB/CN=foo" -passin pass:$(pass) -new -x509 -days 365 -key client2.key -out client2.crt

.PHONY: certs
certs: create-ca create-cacert create-clientcert1 create-clientcert2
	cat client1.crt client2.crt > clientcerts.crt

.PHONY: docker
docker:
	docker build -t test . && docker run -p 8443:443 test
