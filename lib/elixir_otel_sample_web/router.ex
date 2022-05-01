defmodule ElixirOtelSampleWeb.Router do
  use ElixirOtelSampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirOtelSampleWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
