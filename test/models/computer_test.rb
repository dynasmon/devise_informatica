# == Schema Information
#
# Table name: computers
#
#  id              :bigint           not null, primary key
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  client_id       :bigint           not null
#  mother_board_id :bigint           not null
#  processor_id    :bigint           not null
#  video_card_id   :bigint           not null
#
# Indexes
#
#  index_computers_on_client_id        (client_id)
#  index_computers_on_mother_board_id  (mother_board_id)
#  index_computers_on_processor_id     (processor_id)
#  index_computers_on_video_card_id    (video_card_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (mother_board_id => mother_boards.id)
#  fk_rails_...  (processor_id => processors.id)
#  fk_rails_...  (video_card_id => video_cards.id)
#
require "test_helper"

class ComputerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
