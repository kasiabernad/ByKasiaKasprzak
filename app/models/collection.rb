class Collection < ActiveRecord::Base
  has_many :bracelets
  belongs_to :user
end
