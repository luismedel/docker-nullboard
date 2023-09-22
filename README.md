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

## One-time Nullboard setup

Once your container is running, you'll see an output similar to this:

```sh
 * [i] Using data directory /data
 * [i] Config loaded from /data/app-config.json
 * [!] Nullboard token: 85f49d4d21c841eaa5a6712fc2b1dff9
 * [i] Server listening 0.0.0.0:10001...
 * Serving Flask app 'nbagent.main'
 * Debug mode: off
```

Copy the token (here `85f49d4d21c841eaa5a6712fc2b1dff9`)

Navigate to `http://localhost/` and setup Nullboard to make local backups. Paste the token and you're ready to go. The same token will be used on each container run, so you don't need to repeat this setup again, as long as you don't refresh the token or wipe your data.

And you're ready to go. Now you have your own self-hosted Nullboard waiting for you on `http://localhost/`.

## Building the image locally

```sh
$ docker build . -t nullboard
```

## To-do

- [ ] Make Nullboard start with local backups enabled and with the correct token.
- [ ] Use some lighttpd (nginx?) fuckery to only need to expose one single port for both, the http server and the backup agent.
