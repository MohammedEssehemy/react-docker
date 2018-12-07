# react-docker

docker file starter for deploying react apps

# How to use
1. copy Dockerfile, .dockerignore and nginx.conf files to the root of your project

2. use [REACT_APP_API_URL env variable to send ajax requests to backend](https://facebook.github.io/create-react-app/docs/adding-custom-environment-variables)

3. run from the project root dir
```
docker build --build-arg BACKEND_URL="https://mybackend.com/" -t my-awesome-project:mytag .
```
