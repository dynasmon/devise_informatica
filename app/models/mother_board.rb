# == Schema Information
#
# Table name: mother_boards
#
#  id               :bigint           not null, primary key
#  integrated_video :boolean
#  name             :string(255)
#  number_of_slots  :integer
#  supports_amd     :boolean
#  supports_intel   :boolean
#  created_at       :datetime
#  updated_at       :datetime
#  video_card_id    :bigint
#
# Indexes
#
#  index_motherboards_on_video_card_id  (video_card_id)
#
# Foreign Keys
#
#  fk_rails_...  (video_card_id => video_cards.id)
#
class MotherBoard < ApplicationRecord
  has_many :computers
  belongs_to :video_card

  # Adding the boolean attributes
  attribute :supports_intel, :boolean, default: false
  attribute :supports_amd, :boolean, default: false
  attribute :integrated_video, :boolean, default: false

  # Adding the attribute for the number of supported RAM slots
  attribute :number_of_slots, :integer
end
