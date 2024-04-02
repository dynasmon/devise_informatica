# == Schema Information
#
# Table name: brands
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Brand < ApplicationRecord
  validates :name, presence: true
  has_many :processors
end
