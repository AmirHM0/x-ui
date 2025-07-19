FROM ubuntu:22.04

WORKDIR /x-ui

RUN apt-get update && \
    apt-get install -y curl unzip ca-certificates && \
    curl -L -o x-ui-linux-amd64.zip https://github.com/vaxilu/x-ui/releases/latest/download/x-ui-linux-amd64.zip && \
    unzip x-ui-linux-amd64.zip && \
    rm x-ui-linux-amd64.zip && \
    chmod +x x-ui

EXPOSE 54321 443

CMD ["./x-ui"]
