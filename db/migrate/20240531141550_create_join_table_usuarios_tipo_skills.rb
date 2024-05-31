class CreateJoinTableUsuariosTipoSkills < ActiveRecord::Migration[7.1]
  def change
    create_join_table :usuarios, :tipo_skills do |t|
      t.index :usuario_id
      t.index :tipo_skill_id
    end
  end
end
