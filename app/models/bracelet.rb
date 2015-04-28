class Bracelet < ActiveRecord::Base
  has_many :color_positions
  has_many :colors, through: :color_positions
  has_one :row_number
  has_one :order
  belongs_to :user
  after_create :create_color_positions

  def create_color_positions
    a = (self.height * 4.55)
    z = [a, self.row_count].compact.inject(:*)
    y = z + (a * 0.5)
    (1..y).each do |x|
      colorPosition = ColorPosition.create(position: x, color_id: 1)
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
  
  def height_price
    height_price = 0
    if self.height <= 15
      height_price = -3
    end
    if self.height > 19
      height_price = 3
    end
    return height_price
  end
  
  def width_price
    width_price = 0
    if self.row_count >= 8
      width_price = 5
    end
    if self.row_count >= 10
      width_price = 10
    end
    if self.row_count >= 12
      width_price = 15
    end
    return width_price
  end
  
  def color_presence color
    return self.color_positions.where(color: color).count
  end
  
  def dominate_colors
    result = []
    self.colors.uniq.each do |color|
    
      if self.color_presence(color) > 10
        result.push(color)
      end
    end
    
    return result
  end
  
  def color_price
    color_price = 0
    if self.dominate_colors.count >=2
      color_price = 2
    end
    if self.dominate_colors.count > 3
      color_price = 5
    end
    if self.dominate_colors.count > 5
      color_price = 7
    end
    return color_price
  end
  
  def sum_price
    self.price = 25
    return self.price + color_price + height_price + width_price
  end
end
