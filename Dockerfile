FROM debian:11-slim AS builder

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential golang git ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root
COPY . .
RUN go build -o x-ui main.go

FROM debian:11-slim

RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root
COPY --from=builder /root/x-ui /root/x-ui

VOLUME [ "/etc/x-ui" ]
EXPOSE 54321 443 80

CMD ["./x-ui"]
