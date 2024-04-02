# == Schema Information
#
# Table name: video_cards
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
# app/models/video_card.rb

class VideoCard < ApplicationRecord
  has_many :mother_boards
  validates :name, presence: true
  attribute :name, :string
end
