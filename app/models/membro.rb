class Membro < ApplicationRecord
  belongs_to :ministerio
  belongs_to :usuario
end
