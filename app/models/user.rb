class User < ActiveRecord::Base
  has_many :bracelets, through: :collection
  has_many :orders
  has_one :collection
  after_create :set_collection
  
  
  def set_collection
      if !self.collection.nil?
        Collection.find(:user_id => self.id)
      else
        Collection.create(:user_id => self.id)
      end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
end
