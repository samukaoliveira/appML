class CreateTipoSkills < ActiveRecord::Migration[7.1]
  def change
    create_table :tipo_skills do |t|
      t.string :nome

      t.timestamps
    end
  end
end
