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
class RamMemory < ApplicationRecord
  has_many :computer_ram_memories
  has_many :computers, through: :computer_ram_memories

  attribute :size_gb, :integer
end
