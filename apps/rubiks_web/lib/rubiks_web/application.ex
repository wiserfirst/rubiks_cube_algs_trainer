defmodule RubiksWeb.Application do
  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: RubiksWeb.PubSub},
      # Start the endpoint when the application starts
      RubiksWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RubiksWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    RubiksWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
