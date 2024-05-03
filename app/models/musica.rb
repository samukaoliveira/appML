class Musica < ApplicationRecord
  has_many :versao
  has_and_belongs_to_many :escalas
end
