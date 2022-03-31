class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :last_used_at, default: Time.now
      t.boolean :status, default: true
      t.string :token, unique: true

      t.timestamps
    end
  end
end
