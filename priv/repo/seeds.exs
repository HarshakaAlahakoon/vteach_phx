# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     VteachPhx.Repo.insert!(%VteachPhx.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias VteachPhx.Accounts
alias VteachPhx.Accounts.User

user_list = [
  %{
    email: "harshaka@vteach.lk",
    username: "Harshaka",
    role: "admin",
    password: "test",
    password_confirmation: "test"
  },
  %{
    email: "admin@vteach.lk",
    username: "Admin",
    role: "admin",
    password: "test",
    password_confirmation: "test"
  }
]

Enum.each(user_list, fn user ->
  Accounts.create_user(user)
end)
