class CreateMembros < ActiveRecord::Migration[7.1]
  def change
    create_table :membros do |t|
      t.references :ministerio, null: false, foreign_key: true
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
