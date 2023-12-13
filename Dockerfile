FROM golang:1.21.4-alpine3.18 as builder

ENV PROTOC_GO=v1.31.0
ENV PROTOC_GRPC=v1.3.0
ENV PROTOC_GRPC_GW=v2.18.1

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@$PROTOC_GO
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@$PROTOC_GRPC
RUN go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@$PROTOC_GRPC_GW

FROM bufbuild/buf:1.28.1 as buf

RUN mkdir /.cache && chmod 777 /.cache

COPY --from=builder /go/bin /usr/bin
