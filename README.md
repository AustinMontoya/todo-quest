# TodoQuest

TodoQuest aims to be a very basic [Habitica](https;//habitica.com) clone for the
purposes of discovering tools, patterns, and practices to facilitate
microservice development.

Currently, the two following services are available:

- [Todos Service](https://github.com/grrizzly/todos-backend-couchdb) - Initially
  an implementation of [TodoBackend](https://todobackend.com). Expanded to support users
  (known as "players" in TodoQuest)
- [Players Service](https://github.com/grrizzly/todos-player-service) - A basic user service that tracks player experience and level based on completed todos

# Installation

This repo provides a docker-compose file for getting the full platform up and
running quickly. For instructions on how to set your environment up for local
development, see the Readme for each service's repository.

### Up and Running

1. Make sure [Docker](https://docker.com) and [docker-compose](https://docs.docker.com/compose/) are installed and running
1. `git clone https://github.com/grrizzly/todo-quest.git && cd todo-quest`
1. `docker-compose up`


## Tests

There is a minimal set of [Postman](https://www.getpostman.com/) smoke tests for verifying the application is
working on your machine. Check the `postman/` folder for a collection and
environment you can import. Note that `host_ip` environment variable may need to be updated to match your Docker host IP.

## Disclaimer

 We plan on moving to semantic versioning for the components that make up this platform as the cohere. That being said, this is currently a research project in
 the early stages, stuff might not be complete, well-documented or easy to use.
