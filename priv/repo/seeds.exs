# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Core.Repo.insert!(%Core.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, admin} =
  %Core.Accounts.User{}
  |> Core.Accounts.User.registration_changeset(%{
    name: "Ziyan Junaideen",
    phone: "+94712477701",
    email: "ziyan@jdeen.com",
    password: "m1cmPlxp@ssw0rd"
  })
  |> Core.Repo.insert()

{:ok, post} =
  %Core.Blog.Post{}
  |> Core.Blog.Post.create_changeset(%{
    title: "Hello, world!",
    body: "This is the first post in our blog.",
    slug: "hello-world",
    views: 0
  })
  |> Core.Repo.insert()
