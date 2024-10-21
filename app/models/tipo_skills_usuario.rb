class TipoSkillsUsuario < ApplicationRecord
    belongs_to :tipo_skill
    belongs_to :usuario
  end
  