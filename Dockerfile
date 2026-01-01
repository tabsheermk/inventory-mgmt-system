# ---------- Frontend build ----------
FROM node:18-alpine AS frontend-build
WORKDIR /app/frontend
COPY frontend/package.json frontend/package-lock.json ./
RUN npm ci
COPY frontend .
RUN npm run build

# ---------- Backend build ----------
FROM hexpm/elixir:1.17.1-erlang-27.3.4.1-alpine-3.23.2 AS backend-build
WORKDIR /app/backend

RUN apk add --no-cache build-base git

ENV MIX_ENV=prod

COPY backend/mix.exs backend/mix.lock ./
RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get --only prod
RUN mix deps.compile

COPY backend .
COPY --from=frontend-build /app/frontend/dist ./priv/static

RUN mix assets.deploy
RUN mix compile
RUN mix release

# ---------- Runtime ----------
FROM alpine:3.18 AS runtime
RUN apk add --no-cache libstdc++ openssl ncurses-libs

WORKDIR /app
COPY --from=backend-build /app/backend/_build/prod/rel/backend ./

ENV PHX_SERVER=true
ENV PORT=4000

EXPOSE 4000
CMD ["bin/backend", "start"]
