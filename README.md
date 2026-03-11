# ikds-deploy
Start a Virtuoso instance as an RDF store and configure inotify to monitor the `rdf` directory for newly created files.
Each new file is immediately loaded into the RDF store.

Currently, the graph is <http://example.org/> and `rdf` only accepts `.ttl` files.

## Install

### Docker
Install Docker.



### Run
#### Configuration

Update `dot_env` file and rename the file to `.env`.

#### Execute docker to build and start

```
docker compose up
```

#### Endpoint:
`http://127.0.0.1:8890/sparql/`

### Stop docker

```
docker compose down
```

# References
Virtuoso Open-Source Edition: <https://vos.openlinksw.com/owiki/wiki/VOS>

Docker: <https://docs.docker.com/>

Docker compose: <https://docs.docker.com/reference/cli/docker/compose/>


inotify-tools: <https://github.com/inotify-tools/inotify-tools>

inotify: <https://man7.org/linux/man-pages/man7/inotify.7.html>
