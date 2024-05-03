class CreateEscalaMusicaJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :escalas_musicas, id: false do |t|
      t.belongs_to :escala
      t.belongs_to :musica
    end

    add_index :escalas_musicas, [:escala_id, :musica_id]
  end
end
