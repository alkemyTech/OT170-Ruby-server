class CreateSlides < ActiveRecord::Migration[6.1]
  def change
    create_table :slides do |t|
      t.text :text, null: false
      t.integer :order, null: false

      t.timestamps
    end
  end
end
