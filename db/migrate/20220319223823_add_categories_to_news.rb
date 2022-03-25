class AddCategoriesToNews < ActiveRecord::Migration[6.1]
  def change
    add_reference :news, :category, foreign_key: true, null: false
  end
end
