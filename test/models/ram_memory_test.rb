# == Schema Information
#
# Table name: ram_memories
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  size_gb    :integer
#  created_at :datetime
#  updated_at :datetime
#
require "test_helper"

class RamMemoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
