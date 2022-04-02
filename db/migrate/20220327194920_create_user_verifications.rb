class CreateUserVerifications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_verifications do |t|
      t.references :user, null: false, foreign_key: true
      t.string :status, default: 'pending'
      t.string :token, unique: true
      t.string :verify_type

      t.timestamps
    end
  end
end
