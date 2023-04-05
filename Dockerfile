FROM alpine:latest

# Install required package
RUN apk update && \
    apk add curl && \
    rm -rf /var/cache/apk/*

# Download and install NextDNS
RUN curl -sL https://nextdns.io/install | sh

ENV NEXTDNS_ARGUMENTS="-report-client-info -log-queries -cache-size 10MB -max-ttl 5s -setup-router"
ENV NEXTDNS_ID=abcdef

# Start NextDNS service
CMD /usr/bin/nextdns run ${NEXTDNS_ARGUMENTS} -config ${NEXTDNS_ID}
