FROM node:8-stretch as build-stage
LABEL maintainer="Mohammed Essehemy <mohammedessehemy@gmail.com>"

ARG BACKEND_URL

ENV REACT_APP_API_URL=$BACKEND_URL

WORKDIR /app

COPY package*.json /app/

RUN npm install --unsafe-perm && \
    npm audit fix

COPY ./ /app/

RUN npm run build


FROM nginxinc/nginx-unprivileged:stable-alpine
LABEL maintainer="Mohammed Essehemy <mohammedessehemy@gmail.com>"

WORKDIR /usr/share/nginx/html

COPY --from=build-stage /app/build/ /usr/share/nginx/html

USER root

RUN chown 1001:1001 -R /usr/share/nginx/html/

USER 1001

COPY nginx.conf  /etc/nginx/conf.d/default.conf
