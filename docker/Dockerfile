FROM node:18 as base
WORKDIR /app
ENV NX_DAEMON=false

RUN yarn config set unsafe-disable-integrity-migration false

FROM base as build

COPY package.json ./
COPY yarn.lock ./
COPY packages ./packages
COPY scripts ./scripts

RUN yarn install --frozen-lockfile --non-interactive

COPY . .
RUN yarn nx build tiste --configuration=aws


FROM nginx:1.23
WORKDIR /usr/share/nginx/html

RUN apt-get update -y && apt-get install jq -y

# COPY --from=build /app/scripts/
# RUN chmod +x /docker-entrypoint.d/populate_react_config.sh
COPY nginx.conf /etc/nginx/conf.d/default.conf
RUN chown -R nginx:nginx /usr/share/nginx/html