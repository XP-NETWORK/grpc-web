FROM golang:1.16.2 as build

# ENV GOPATH=/go

WORKDIR /go/src/github.com/improbable-eng/grpc-web
COPY . .
RUN go install ./go/grpcwebproxy

FROM ubuntu:20.04
WORKDIR /opt/app
COPY --from=build /go/bin/grpcwebproxy /opt/app/
COPY entrypoint.sh entrypoint.sh
ENV PATH="${PATH}:/opt/app"
ENTRYPOINT [ "./entrypoint.sh" ]