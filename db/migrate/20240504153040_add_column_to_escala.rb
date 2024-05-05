class AddColumnToEscala < ActiveRecord::Migration[7.1]
  def change
    add_column :escalas, :musica1, :integer
    add_column :escalas, :musica2, :integer
    add_column :escalas, :musica3, :integer
    add_column :escalas, :musica_extra, :integer
    add_column :escalas, :musica1_versao, :integer
    add_column :escalas, :musica2_versao, :integer
    add_column :escalas, :musica3_versao, :integer
    add_column :escalas, :musica_extra_versao, :integer
  end
end
