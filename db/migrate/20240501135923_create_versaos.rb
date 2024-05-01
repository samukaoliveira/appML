class CreateVersaos < ActiveRecord::Migration[7.1]
  def change
    create_table :versaos do |t|
      t.string :nome
      t.string :link_youtube

      t.timestamps
    end
  end
end
