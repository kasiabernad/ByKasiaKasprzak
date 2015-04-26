class Color < ActiveRecord::Base
  scope :available, -> { where(available: true)}
  
  def self.find_by_hex hex
    self.where(hex: hex).first
  end
  
  def available_css_class
    self.available ? "dostepny" : "niedostepny"
  end
  
end
