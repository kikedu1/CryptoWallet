class MiningType < ApplicationRecord
    has_many :coins #me parece que aqui é em plural porque são muitas moedas, não referenciando a tabela moedas, verificar
end
