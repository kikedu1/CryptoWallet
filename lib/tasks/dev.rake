namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD ...") {%x(rails db:drop:_unsafe)}
      show_spinner("Criando BD ...") {%x(rails db:create)}
      show_spinner("Migrando BD ...") {%x(rails db:migrate)}
      #show_spinner("Populando BD ...") {%x(rails db:seed)}
      %x(rails dev:add_mining_types) # deve ir primeiro que o add_coins devido a coluna mining_type e o sample, where, etc
      %x(rails dev:add_coins)
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
                  url_image: "https://static.vecteezy.com/system/resources/previews/008/505/801/original/bitcoin-logo-color-illustration-png.png",
                  mining_type: MiningType.find_by(acronym: 'PoW')}, # o where não funciona pq retorna um array. find só aceita informar o id
                  
                  {description: "Ethereum",
                  acronym: "ETH",
                  url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png",
                  mining_type: MiningType.all.sample},
                  
                  {description: "Dash",
                  acronym: "DASH",
                  url_image: "https://cdn.icon-icons.com/icons2/2699/PNG/512/dash_logo_icon_170297.png",
                  mining_type: MiningType.all.sample},
                  
                  {description: "Iota",
                  acronym: "IOT",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1720.png",
                  mining_type: MiningType.all.sample},
                  
                  {description: "ZCash",
                  acronym: "ZEC",
                  url_image: "https://s2.coinmarketcap.com/static/img/coins/200x200/1437.png",
                  mining_type: MiningType.all.sample}
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
                  {description: "Proof of Work", acronym: "PoW"},
                  {description: "Proof of Stake", acronym: "PoS"},
                  {description: "Proof of Capacity", acronym: "PoC"}
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