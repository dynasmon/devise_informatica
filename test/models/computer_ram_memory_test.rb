# == Schema Information
#
# Table name: computer_ram_memories
#
#  id            :bigint           not null, primary key
#  capacity      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  computer_id   :bigint           not null
#  ram_memory_id :bigint           not null
#
# Indexes
#
#  index_computer_ram_memories_on_computer_id    (computer_id)
#  index_computer_ram_memories_on_ram_memory_id  (ram_memory_id)
#
# Foreign Keys
#
#  fk_rails_...  (computer_id => computers.id)
#  fk_rails_...  (ram_memory_id => ram_memories.id)
#
require "test_helper"

class ComputerRamMemoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
