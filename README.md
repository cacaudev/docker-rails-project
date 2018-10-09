# Docker Rails App

My first Rails App created and running on Docker from a Windows Host Machine.

Observations for future setup references:

- Used Docker-Toolbox and VirtualBox to setup Docker.
- Docker Compose is already installed with Docker-Toolbox.
- Windows 10 Home used, only have one network adapter.
- After Docker-Toolbox is finished installing (QuickStart Terminal, Kitematic, VirtualBox),
  run QuickStart Terminal to bootstrap docker and create virtualbox image
  => IF HOST-ONLY ADAPTER ERROR OCCUR: DISABLE VBOX BRIDGE
  FROM MAIN NETWORK ADAPTER AND RUN QUICKSTART AGAIN!!
- IP from virtualbox machine image will be in GREEN
- Docker only works on Docker QuickStart Terminal and Git Bash Terminal.
- When creating a new project:
  - Check docker and docker-compose versions:
    ```sh
    $ docker -v
    $ docker-compose -v
    ```
  - Run Hello World container to check if everything is working as it should be:
    ```sh
    $ docker run hello-world
    ```
  - App folder MUST be in c:/Users/Username/ (to mount docker image, copy app
    folder and prevent "Gemfile not found" error when running docker-compose up
    first time).
  - To check wich containers are running:
    ```sh
    $ docker ps
    ```
  - To stop container:
    ```sh
    $ docker stop <container-id>
    ```
  - Followed RubyThursday guide:  
  https://www.youtube.com/watch?v=KH6pcHb6Wug&t=2s

> References from solved errors:  
> https://github.com/docker/docker.github.io/issues/3842  
> https://github.com/docker/compose/issues/2103  

Things you may want to cover:
## Ruby version
ruby 2.3.4

## Rails version
rails', '4.2.5'

## System dependencies
Postgres DB

## Configuration
To bootstrap the app and the postgres db run:
  ```sh
  $ docker-compose up
  ```
Always after changing something in Gemfile run:
  ```sh
  $ docker-compose build
  ```
## Database

  ### Database creation
  ```sh
  $ docker-compose run web rake db:create
  ```
  ### Database initialization
  ```sh
  $ docker-compose run web rake db:migrate
  ```