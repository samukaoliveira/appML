class CreateMusicas < ActiveRecord::Migration[7.1]
  def change
    create_table :musicas do |t|
      t.string :nome
      t.string :interprete
      t.string :tom_original
      t.string :ultimo_tom_tocado
      t.integer :bmp_original
      t.integer :ultimo_bpm_tocado
      t.string :obs
      t.references :versao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
