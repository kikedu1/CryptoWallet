namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD ...") {%x(rails db:drop:_unsafe)}
      show_spinner("Criando BD ...") {%x(rails db:create)}
      show_spinner("Migrando BD ...") {%x(rails db:migrate)}
      #show_spinner("Populando BD ...") {%x(rails db:seed)}
      %x(rails dev:add_coins)
      %x(rails dev:add_mining_types)
    else
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end
  
  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando as moedas ...") do # importante colocar o do aqui e end no final, já que não tem uma instrução no terminal como no caso da liha 5:7 com {}
      coins =  [
                  {description: "Bitcoin",
                  acronym: "BTC",
                  url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png"},
                  
                  {description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png"},
                  
                  {description: "Dash",
                  acronym: "DASH",
                  url_image: "https://cdn.icon-icons.com/icons2/2699/PNG/512/dash_logo_icon_170297.png"},
                  
                  {description: "Iota",
                  acronym: "IOT",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png"},
                  
                  {description: "ZCash",
                  acronym: "ZEC",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png"}
                ]

      coins.each do |coin|
        Coin.find_or_create_by!(coin)
      end
    end
  end
  
  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando os tipos de mineração ...") do 
      mining_types =  [
                  {name: "Proof of Work", acronym: "PoW"},
                  {name: "Proof of Stake", acronym: "PoS"},
                  {name: "Proof of Capacity", acronym: "PoC"}
                ]

      mining_types.each do |mining_type|
        MiningType.find_or_create_by!(mining_type)
      end
    end
  end 
  
  private
  
  def show_spinner(msg_start, msg_end = "Concluído!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end