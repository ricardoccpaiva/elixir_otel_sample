defmodule ElixirOtelSample.Repo do
  use Ecto.Repo,
    otp_app: :elixir_otel_sample,
    adapter: Ecto.Adapters.Postgres
end
