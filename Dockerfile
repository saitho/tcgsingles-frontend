FROM node:alpine AS node
WORKDIR /work
ADD package.json .
ADD package-lock.json .
RUN npm install

FROM klakegg/hugo:0.95.0-ext AS builder
COPY --from=node /work/node_modules /src/node_modules
ADD . /src
RUN ./hugo.js -f

# build final image
FROM caddy:2.4.0-alpine
RUN rm -rf /usr/share/caddy/*
COPY --from=builder /src/hugo/public /usr/share/caddy/
