class Bracelet < ActiveRecord::Base
  has_many :color_positions
  has_one :row_number
  after_create :create_color_positions
  
  def create_color_positions
    (1..30).each do |x|
      colorPosition = ColorPosition.create(position: x, color_id: 1)
      colorPosition.bracelet = self
      colorPosition.save!
    end 
  end
  
end
