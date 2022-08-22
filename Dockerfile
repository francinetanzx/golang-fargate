FROM golang:alpine

RUN mkdir /app
WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /docker-build

EXPOSE 8080

CMD [ "/docker-build" ]