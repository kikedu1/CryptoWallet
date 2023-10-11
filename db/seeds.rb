# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas ...") # o professor decidiu fazer este processo no dev.rake, eu nãp concordo muito mais tudo bem
spinner.auto_spin

coins =  [
            {description: "Bitcoin",
            acronym: "BTC",
            url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"},
            
            {description: "Ethereum",
            acronym: "ETH",
            url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png"},
            
            {description: "Dash",
            acronym: "DASH",
            url_image: "https://cdn.icon-icons.com/icons2/2699/PNG/512/dash_logo_icon_170297.png"}
          ]


coins.each do |coin|
    Coin.find_or_create_by!(coin)
end

=begin
Coin.create!(
    [
    {description: "Bitcoin",
    acronym: "BTC",
    url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"},
    
    {description: "Ethereum",
    acronym: "ETH",
    url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png"},
    
    {description: "Dash",
    acronym: "DASH",
    url_image: "https://cdn.icon-icons.com/icons2/2699/PNG/512/dash_logo_icon_170297.png"}
    ]
)
=end

spinner.success("(Concluído!)")