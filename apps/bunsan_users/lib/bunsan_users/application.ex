defmodule BunsanUsers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BunsanUsers.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: BunsanUsers.PubSub}
      # Start a worker by calling: BunsanUsers.Worker.start_link(arg)
      # {BunsanUsers.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: BunsanUsers.Supervisor)
  end
end
