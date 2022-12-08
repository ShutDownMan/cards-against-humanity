# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JacahBackend.Repo.insert!(%JacahBackend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias JacahBackend.Repo
alias JacahBackend.Admin.User
alias JacahBackend.Game.CardPack
alias JacahBackend.Game.Card

# new uuid: 9faa9a9a-9faa-9faa-9faa-9faa9faa9faa

# insert a value on user
Repo.insert!(%User{
  id: "8ad8a646-e31f-11e4-aace-600308960662",
  address: "Example street, 123",
  name: "John Doe",
  email: "john@example.com"
})

# insert a value on card_pack
Repo.insert!(%CardPack{
  id: "65c0b9c0-e31f-11e4-aace-600308960662",
  name: "Pack Padrao",
  description: "O pack padrao do jogo"
})

# insert a value on card
Repo.insert!(%Card{
  id: "9faa9a9a-9faa-9faa-9faa-9faa9faa9faa",
  content: "lorem ___ dolor sit amet",
  pack_id: "65c0b9c0-e31f-11e4-aace-600308960662"
})
