# == Schema Information
#
# Table name: rols
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Rol, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
