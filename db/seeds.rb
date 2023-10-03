# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cadastrando as Moedas"

Coin.create!(
    description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"
)

Coin.create!(
    description: "Ethereum",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png"
)

Coin.create!(
    description: "Dash",
    acronym: "DASH",
    url_image: "https://cdn.icon-icons.com/icons2/2699/PNG/512/dash_logo_icon_170297.png"
)

puts "Moedas cadastradas com sucesso!"