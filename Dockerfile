FROM node:23.1.0-alpine3.20 AS build

RUN [ "apk", "add", "--no-cache", "git" ]

WORKDIR /usr/src/

RUN [ "git", "clone", "https://github.com/drawdb-io/drawdb" ]

WORKDIR /usr/src/drawdb/

RUN [ "npm", "install" ]
RUN [ "npm", "run", "build" ]

FROM httpd:2.4 AS RUNNER

COPY --from=build /usr/src/drawdb/dist/ /usr/local/apache2/htdocs/

EXPOSE 80
