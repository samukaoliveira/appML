class AddColumnToVersao < ActiveRecord::Migration[7.1]
  def change
    add_reference :versaos, :musica
  end
end
