class TipoSkill < ApplicationRecord
    has_and_belongs_to_many :usuarios, join_table: "tipo_skills_usuarios"
end
