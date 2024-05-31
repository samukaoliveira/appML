class Usuario < ApplicationRecord
  has_and_belongs_to_many :tipo_skills, join_table: "tipo_skills_usuarios"
  has_and_belongs_to_many :ministerios, join_table: "membros"
end
