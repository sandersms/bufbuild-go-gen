FROM golang:1.23.4-alpine3.21 as builder

ENV PROTOC_GO=v1.35.2
ENV PROTOC_GRPC=v1.5.1
ENV PROTOC_GRPC_GW=v2.24.0

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@$PROTOC_GO && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@$PROTOC_GRPC && \
    go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@$PROTOC_GRPC_GW

FROM bufbuild/buf:1.50.0 as buf

RUN mkdir /.cache && chmod 777 /.cache

COPY --from=builder /go/bin /usr/bin
