# Etap pierwszy - budowa aplikacji webowej
FROM node:alpine AS builder
WORKDIR /usr/app
COPY ./package.json ./
COPY ./app.js ./
ARG VERSION
ENV APP_VERSION=version.${VERSION:-v1}
RUN npm install && \ 
    echo "VERSION=$APP_VERSION" > .env

EXPOSE 8080
 
CMD ["npm", "start"]

# Etap drugi - obraz Nginx z aplikacją
FROM nginx:latest
COPY --from=builder /usr/app /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean 
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=1s \
  CMD curl -f http://localhost/ || exit 1
CMD ["nginx", "-g", "daemon off;"]


