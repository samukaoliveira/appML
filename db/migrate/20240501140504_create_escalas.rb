class CreateEscalas < ActiveRecord::Migration[7.1]
  def change
    create_table :escalas do |t|
      t.date :data
      t.time :hora
      t.string :nome
      t.references :musica, null: false, foreign_key: true
      t.string :baterista
      t.string :baixista
      t.string :tecladista
      t.string :vocalista
      t.string :violonista
      t.string :guitarrista
      t.string :outros
      t.string :obs

      t.timestamps
    end
  end
end
