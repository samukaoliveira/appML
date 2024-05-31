class RemoveTipoSkillIdFromUsuarios < ActiveRecord::Migration[7.1]
  def change
    remove_column :usuarios, :tipo_skill_id, :bigint
  end
end
