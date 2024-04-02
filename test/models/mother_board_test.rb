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
require "test_helper"

class MotherBoardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
