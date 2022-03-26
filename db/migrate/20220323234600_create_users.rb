class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstName, null: false
      t.string :lastName, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :photo

      t.timestamps
    end
  end
end
