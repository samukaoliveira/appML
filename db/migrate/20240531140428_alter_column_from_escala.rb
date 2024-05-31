class AlterColumnFromEscala < ActiveRecord::Migration[7.1]
  def change
    remove_column :escalas, :vionolista
    add_column :escalas, :violonista, :string
  end
end
