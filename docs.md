# Docker commands:

Build `play` container:
```
docker build -t play play
```

Build `ngrok` container:
```
docker build -t ngrok ngrok
```

Run `play` container:
```
docker run -d -p 80 play
```

Run `ngrok` container:
```
docker run -d -p 4040 --link play:http ngrok
```

View all `exited` containers:
```
docker ps -aq -f status=exited
```

Remove all `exited` containers
```
docker ps -aq --no-trunc -f status=exited | xargs docker rm
```


