class Usuario < ApplicationRecord
  belongs_to :tipo_skill
  has_and_belongs_to_many :ministerios, join_table: "membros"
end
