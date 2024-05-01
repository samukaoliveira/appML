class CreateMinisterios < ActiveRecord::Migration[7.1]
  def change
    create_table :ministerios do |t|
      t.integer :membro
      t.integer :lider
      t.string :nome
      t.integer :administrador

      t.timestamps
    end
  end
end
