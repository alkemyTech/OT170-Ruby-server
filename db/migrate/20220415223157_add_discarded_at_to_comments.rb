class AddDiscardedAtToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :discarded_at, :datetime
    add_index :comments, :discarded_at
  end
end
