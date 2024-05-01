class RemoveColumnToMusica < ActiveRecord::Migration[7.1]
  def change
    remove_column :musicas, :versao_id
  end
end
