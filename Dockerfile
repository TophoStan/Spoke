ARG NODE_VERSION=16.13

FROM --platform=linux/amd64 node:${NODE_VERSION}
HEALTHCHECK CMD curl -fk https://localhost:9090 || exit 1
WORKDIR /app

COPY package.json ./
COPY yarn.lock ./
RUN yarn install --frozen-lockfile

COPY . .

CMD ["./scripts/run-local-reticulum.sh"]