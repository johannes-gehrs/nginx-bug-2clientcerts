# Replicate nginx Bug/Limitation

Nginx will not accept the latter of two client certs if the subject is the same.

This code ldsupposed to demonstrate this.

Run `make certs` to create certificates. Run `make docker` to build and run a docker container which
uses the certs.

Then you can test like this:

```
# This will work
curl --insecure --cert ./client1.crt  --key client1.key  https://localhost:8443/index.html
# This will fail
curl --insecure --cert ./client2.crt  --key client2.key  https://localhost:8443/index.html
```

If you change the `subj` to be non-identical between both client certs in the Makefile, then both certs
will be accepted.
