FROM alpine:latest

# install elixir
RUN apk add --update elixir

# install hex
RUN mix local.hex --force

# install rebar
RUN mix local.rebar --force

# create app directory
RUN mkdir /app

# set working directory
WORKDIR /app

# copy the mix files
COPY mix.exs mix.lock ./

# install dependencies
RUN mix deps.get

# copy the rest of the files
COPY . .

ARG POSTGRES_USER
ARG POSTGRES_PASSWORD
ARG POSTGRES_DB
ARG POSTGRES_HOST
ARG POSTGRES_PORT

# setup the database
RUN echo "user = \"$POSTGRES_USER\" password = \"$POSTGRES_PASSWORD\" database = \"$POSTGRES_DB\""
RUN echo "host = \"$POSTGRES_HOST\" port = \"$POSTGRES_PORT\""
RUN ping -c 4 localhost
RUN mix ecto.create
RUN mix ecto.migrate

# expose port 4000
EXPOSE 4000
EXPOSE 4001

# run the app
CMD ["mix", "phx.server"]