# Rubik's Cube Algorithms Trainer

This application demonstrates how various Rubik's Cube algorithms work with
animations. It uses a [Phoenix](https://phoenixframework.org/) umbrella app on
the backend and [Roofpig](https://github.com/larspetrus/Roofpig) on the frontend
for the Cube animations.

## Dependencies

### PostgreSQL

This app uses PostgreSQL for local dev, so make sure you have it installed.

If you are on macOS and use Homebrew, that can be done with the following:

```sh
brew install postgresql
```

If you use other OS, please refer to [PostgreSQL
documentation](https://www.postgresql.org/download/).

You'll also need to create a new database user named `postgres`, since that's
what the app uses to connect to the database.

```sh
createuser -d postgres
```

### Elixir, Erlang and Nodejs

If you use [asdf](https://asdf-vm.com/), you can install the appropriate
versions of Elixir and Erlang with just one command:

```sh
asdf install
```

Otherwise, please refer to the `.tool-versions` file and install the correct
versions with your tool of choice or manually.

## Initial setup

To install the Elixir dependencies and setup the database:

```sh
mix deps.get
mix ecto.setup
```

## Local development

To start the server locally:

```sh
mix phx.server
```

## Deployment

`master` branch is deployed to [Gigalixir](https://gigalixir.com/), which is
kinda a clone of [Heroku](https://www.heroku.com/home), but specifically for
Elixir and Phoenix.

Deploying to Gigalixir is very simple, just push to `master` branch of the
`gigalixir` remote:

```sh
git push gigalixir master
```

This `gigalixir` remote is created automatically when setting up the app for
deployment with the gigalixir cli tool.

For more information about deploying a Phoenix application to Gigalixir, please
refer to the [official
documentation](https://gigalixir.readthedocs.io/en/latest/getting-started-guide.html).

### Clean build cache

Sometimes the build fails because of the previous build cache. When that
happens, there is an extra flag you can pass to clean your cache before building
in case you need it, but you need git 2.9.0 or higher for it to work.

```sh
git -c http.extraheader="GIGALIXIR-CLEAN: true" push gigalixir master
```

### Deploying to Heroku

There is also a `heroku` branch that can be deployed to Heroku.

Similarly just push it to `master` branch of the `heroku` remote:

```sh
git push heroku heroku:master
```
