class CreateUsuarios < ActiveRecord::Migration[7.1]
  def change
    create_table :usuarios do |t|
      t.string :email
      t.string :nome
      t.string :role
      t.references :tipo_skill, null: false, foreign_key: true

      t.timestamps
    end
  end
end
