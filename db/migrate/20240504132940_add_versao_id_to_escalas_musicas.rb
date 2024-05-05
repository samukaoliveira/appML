class AddVersaoIdToEscalasMusicas < ActiveRecord::Migration[7.1]
  def change
    add_reference :escalas_musicas, :versao, foreign_key: true
  end
end
