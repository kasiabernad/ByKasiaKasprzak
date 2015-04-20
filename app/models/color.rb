class Color < ActiveRecord::Base

  def self.find_by_hex hex
    self.where(hex: hex).first
  end
end
