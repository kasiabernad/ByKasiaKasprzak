class Color < ActiveRecord::Base
  has_many :color_positions
  has_many :bracelets, through: :color_positions
  
  scope :available, -> { where(available: true)}

  def self.find_by_hex hex
    self.where(hex: hex).first
  end
  
  def available_css_class
    self.available ? "dostepny" : "niedostepny"
  end
  
end
