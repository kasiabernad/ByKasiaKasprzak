class ColorPosition < ActiveRecord::Base
  belongs_to :color
  belongs_to :bracelet
end
