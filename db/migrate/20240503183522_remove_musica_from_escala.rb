class RemoveMusicaFromEscala < ActiveRecord::Migration[7.1]
  def change
    remove_column :escalas, :musica_id
  end
end
