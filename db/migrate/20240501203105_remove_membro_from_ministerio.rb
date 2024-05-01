class RemoveMembroFromMinisterio < ActiveRecord::Migration[7.1]
  def change
    remove_column :ministerios, :membro
  end
end
