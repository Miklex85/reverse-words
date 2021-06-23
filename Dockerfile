FROM golang:latest
WORKDIR /workspace/src/github.com/Miklex85/reverse-words/
COPY main.go .
RUN go get github.com/gorilla/mux && go get github.com/prometheus/client_golang/prometheus/promhttp
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=0 /workspace/src/github.com/Miklex85/reverse-words/main .
EXPOSE 8080
CMD ["/main"]
