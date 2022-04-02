class AddMissingReference < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :news, foreign_key: true
    add_reference :organizations, :slide, foreign_key: true
  end
end
