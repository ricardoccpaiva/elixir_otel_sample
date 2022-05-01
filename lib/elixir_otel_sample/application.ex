defmodule ElixirOtelSample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    OpentelemetryPhoenix.setup()
    OpentelemetryEcto.setup([:elixir_otel_sample, :repo])

    children = [
      # Start the Ecto repository
      ElixirOtelSample.Repo,
      # Start the Telemetry supervisor
      ElixirOtelSampleWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ElixirOtelSample.PubSub},
      # Start the Endpoint (http/https)
      ElixirOtelSampleWeb.Endpoint
      # Start a worker by calling: ElixirOtelSample.Worker.start_link(arg)
      # {ElixirOtelSample.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirOtelSample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixirOtelSampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
