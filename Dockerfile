FROM node:12-alpine as base

LABEL maintainer="thiagolsfortunato@hotmail.com"

ENV NOME_CANDIDATO "CANDIDATO"

WORKDIR /app

FROM base as build

# INSTALL DEPENDENCIES
COPY app/package.json /app

RUN npm install

FROM base as prod

# COPY APP 
COPY app/app.js /app

# CREATE APP USER
RUN addgroup -S app && \
    adduser -S -G app app && \
    chown -R app:app /app && \
    pwd

# COPY DEPENDENCIES INSTALLED
COPY --from=build /app/node_modules node_modules

USER app

# RUN APP
CMD [ "node", "app.js" ]

EXPOSE 3000
