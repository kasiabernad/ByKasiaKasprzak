class Bracelet < ActiveRecord::Base
  has_many :color_positions
  has_many :colors, through: :color_positions
  has_one :row_number
  has_one :order
  belongs_to :user
  after_create :create_color_positions

  def create_color_positions
    z = [self.height, self.row_count].compact.inject(:*)
    y = z + (self.height * 0.5)
    (1..y).each do |x|
      colorPosition = ColorPosition.create(position: x, color_id: 2)
      colorPosition.bracelet = self
      colorPosition.save!
    end 
  end
  
  def positions_in_first_look_for_iteration iteration
    row_width = row_count
    number_of_columns = (iteration % 2) == 0 ? row_width : row_width + 1

    idx = iteration * row_width +  (iteration)
    
    return self.color_positions.slice(idx, number_of_columns)
  
  end
  
  
  def positions_in_second_look_for_iteration iteration
    x = row_count % 2? row_count + 2 : rown_count + 1
    row_width = x * 0.5
    positions = positions_in_first_look_for_iteration(iteration)
    
    if !positions
      return nil
    end
    
    median = positions.count * 0.5
    
    from_idx = row_width * 0.5 - 1
    if iteration % 2 == 0
      from_idx = from_idx - 1
    end
    
    return positions.slice(from_idx, row_width)
  
  end
  
  # def sum_price
  #   if self.color_position.color = 1
  #     price_1 = 0
  #   if self.color_position.color = 2
  #     price_1 = 5
  #   if self.color_position.color = 3
  #     price_1 = 7
  #   if self.color_position.color = 4
  #     price_1 = 10
  #   end
  #   self.sum_price = price_1
  # end
end
