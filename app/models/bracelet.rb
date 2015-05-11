class Bracelet < ActiveRecord::Base
  has_many :color_positions
  has_many :order_items
  has_many :colors, through: :color_positions
  belongs_to :collection
  after_create :create_color_positions
  validates :height, :inclusion => { :in => 5..25, :message => "The height must be between 5 and 25" }
  validates :row_count, :inclusion => { :in => 5..15, :message => "The height must be between 5 and 15" }

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
  
  # def set_collection
  #     if self.collection.nil?
  #       self.collection = user.collection
  #     end
  # end

  def positions_in_first_look_for_iteration iteration
    row_width = row_count
    number_of_columns = (iteration % 2) == 0 ? row_width : row_width + 1

    idx = iteration * row_width +  (iteration)
    
    return self.color_positions.slice(idx, number_of_columns)
  
  end

  
  def rows_for_first_throw
    counter = 0
    (0..100).each do |i|
      if positions_in_first_look_for_iteration(i).blank?
        break
      else
        counter = counter + 1 
      end
    end

    return counter - 1
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
  
  
  def find_unavailable_colors
    result = []
    self.colors.uniq.each do |color|
      if color.available == false
        result.push("Kolor #{color.name} przestał być dostępny")
      end
    end
    return result
  end
  
  def pattern
    result = Hash.new
    index = 0
    counter = 0
    hash_position = 0
    current_color = self.color_positions.first.color
    self.color_positions.each do |cp|
      if cp.color == current_color
        counter = counter + 1
      end
      index = index + 1
      next_position = self.color_positions[index]
      if !next_position.present? || next_position.color != current_color 
        result[hash_position]= {'color' => current_color, 'count' => counter}
        counter = 0
        hash_position = hash_position + 1
        if next_position.present?
          current_color = next_position.color
        end
      end
    end
    
    return result
  end

  private
    def default_values
      self.draft ||= true
    end
end
