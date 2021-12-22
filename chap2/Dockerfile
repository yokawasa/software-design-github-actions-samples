FROM golang:1.17.1-buster AS builder
ARG VERSION=dev
WORKDIR /go/src/app
COPY main.go .
RUN go build -o main main.go
FROM debian:buster-slim
COPY --from=builder /go/src/app/main /go/bin/main
ENV PATH="/go/bin:${PATH}"
CMD ["main"]
