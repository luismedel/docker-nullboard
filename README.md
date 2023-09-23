# docker-nullboard

This is a self-contained version of [Nullboard](https://github.com/apankrat/nullboard) along with the [nbagent](https://github.com/luismedel/nbagent) local backup agent.

## Running

### The Docker compose way

Edit the `docker-compose.yml` file and set your desired path for the `/data` volume (defaults to `./data`). Then:

```sh
$ docker-compose up
```

### The Docker CLI way

Run your container the usual way:

```sh
$ docker run -v $(pwd)/data:/data -p 80:80 -p 10001:10001 luismedel/nullboard
```

And you're ready to go. Now you have your own self-hosted Nullboard waiting for you on `http://localhost/`. All your changes will be automatically saved in the data directory you choosed.

## Building the image locally

```sh
$ docker build . -t nullboard
```

## To-do

- [x] Make Nullboard start with local backups enabled and with the correct token.
- [ ] Use some lighttpd (nginx?) fuckery to only need to expose one single port for both, the http server and the backup agent.
