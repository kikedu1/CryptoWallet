class Coin < ApplicationRecord
    belongs_to :mining_type#, optional: true #para que funcione dev:setup e coloque minig_type_id vazio
end
