# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     ElixirOtelSample.Repo.insert!(%ElixirOtelSample.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

names = ~w(molly bob alice peter susan richard doug ryan mary rob)

Enum.each(names, fn name -> ElixirOtelSample.Repo.insert!(%ElixirOtelSample.Accounts.User{name: name}) end)
