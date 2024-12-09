# bufbuild-go-gen

[![Linters](https://github.com/sandersms/bufbuild-go-gen/actions/workflows/linters.yaml/badge.svg)](https://github.com/sandersms/bufbuild-go-gen/actions/workflows/linters.yaml)
[![Docker](https://github.com/sandersms/bufbuild-go-gen/actions/workflows/docker-publish.yaml/badge.svg)](https://github.com/sandersms/bufbuild-go-gen/actions/workflows/docker-publish.yaml)

This is the source for a docker image that provides the buf generate operation in docker.  The image contains the buf, protoc-gen-go, protoc-gen-go-grpc, and protoc-gen-grpc-gateway functions packages in.  The basic buf code does not include the files that are necessary to generate the protobuf files and the files that relate to grpc and grpc gateway.