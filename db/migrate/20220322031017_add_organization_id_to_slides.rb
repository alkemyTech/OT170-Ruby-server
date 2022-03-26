class AddOrganizationIdToSlides < ActiveRecord::Migration[6.1]
  def change
   add_reference :slides, :organization, null: false, foreign_key: true
  end
end
