class CreateNews < ActiveRecord::Migration[6.1]
  def change
    create_table :news do |t|
      t.string :name, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
