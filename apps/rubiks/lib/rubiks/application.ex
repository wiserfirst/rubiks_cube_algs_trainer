defmodule Rubiks.Application do
  @moduledoc """
  The Rubiks Application Service.

  The rubiks system business domain lives in this application.

  Exposes API to clients such as the `RubiksWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Rubiks.Repo, []),
    ], strategy: :one_for_one, name: Rubiks.Supervisor)
  end
end
