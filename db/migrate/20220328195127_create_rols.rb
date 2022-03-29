# frozen_string_literal: true

class CreateRols < ActiveRecord::Migration[6.1]
  def change
    create_table :rols do |t|
      t.string :name, null: false
      t.string :description

      t.timestamps
    end
  end
end
