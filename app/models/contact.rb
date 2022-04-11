# frozen_string_literal: true

# == Schema Information
#
# Table name: contacts
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  email        :string
#  message      :text
#  name         :string
#  phone        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_contacts_on_discarded_at  (discarded_at)
#
class Contact < ApplicationRecord
  include Discard::Model

  validates :name, presence: true
  validates :email, presence: true
end
