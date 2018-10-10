# Simple Dockerized Rails App

My first Rails App created by and running on Docker from a Windows Host Machine.

Observations for future setup references:

- Used Docker-Toolbox and VirtualBox to setup Docker.
- Docker Compose is already installed with Docker-Toolbox.
- Windows 10 Home used, only have one network adapter.
- After Docker-Toolbox is finished installing (QuickStart Terminal, Kitematic, VirtualBox),
  run QuickStart Terminal to bootstrap docker and create virtualbox image  
  => if host-only adapter error occur: disable vbox bridge
  from main network adapter and run quickstart again! ☕
- IP from virtualbox machine image will be in GREEN.
- Docker only works on Docker QuickStart Terminal and Git Bash Terminal.
- To check docker and docker-compose versions:  
  ```sh
  $ docker -v
  $ docker-compose -v
  ```
- Run Hello World container to check if everything is working as it should be:  
    ```sh
    $ docker run hello-world
    ```
- To check which containers are running:
    ```sh
    $ docker ps
    ```
- To stop container:
    ```sh
    $ docker stop <container-id>
    ```
- When creating a new project:  
  - App folder MUST be in c:/Users/Username/ (to mount docker image, copy app
    folder and prevent "Gemfile not found" error when running docker-compose up
    first time).    
- To clear Docker environment:  
    ```sh
    # Delete every Docker containers
    # Must be run first because images are attached to containers
    $ docker rm -f $(docker ps -a -q)

    # Delete every Docker image
    $ docker rmi -f $(docker images -q)
    ```
- To bootstrap the app and the postgres db run:  
    ```sh
    $ docker-compose up
    ```
- Always after changing something in Gemfile run:  
  ```sh
  $ docker-compose build
  ```
## References and guides  
> https://davidwalsh.name/docker-remove-all-images-containers  
> https://auth0.com/blog/ruby-on-rails-killer-workflow-with-docker-part-1/  
> RubyThursday guide: https://www.youtube.com/watch?v=KH6pcHb6Wug&t=2s  
> From solved errors:  
> https://github.com/docker/docker.github.io/issues/3842  
> https://github.com/docker/compose/issues/2103

Settings for this project:
## Ruby version
ruby 2.3.4

## Rails version
rails ~> 4.2.7.1 

## System dependencies
Postgres DB

## Database
### Database creation
```sh
$ docker-compose run web rake db:create
```
### Database initialization
```sh
$ docker-compose run web rake db:migrate
```
