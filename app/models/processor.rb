# == Schema Information
#
# Table name: processors
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brand_id   :bigint           not null
#
# Indexes
#
#  index_processors_on_brand_id  (brand_id)
#
# Foreign Keys
#
#  fk_rails_...  (brand_id => brands.id)
#
class Processor < ApplicationRecord
  has_many :computers
  belongs_to :brand

  private

  def set_brand_name
    self.brand_name = brand.name if brand.present?
  end

end
