class Order < ActiveRecord::Base
  has_many :order_items
  has_many :bracelets, through: :order_items
  belongs_to :user
  accepts_nested_attributes_for :user
  belongs_to :order_status
  before_create :set_order_status
  before_save :update_subtotal

  # accepts_nested_attributes_for :user
  # accepts_nested_attributes_for :order_items
  # accepts_nested_attributes_for :bracelets
  #
  def subtotal
    order_items.collect { |oi| oi.valid? ? (oi.quantity * oi.unit_price) : 0 }.sum
  end
  def check_if_unless_one_color_is_unavailable
    self.bracelets.each do |bracelet|
      bracelet.colors.uniq.each do |color|
        if color.available == false
          return false
        end
      end
    end
    return true
  end
  
private
  def set_order_status
    self.order_status_id = 1
  end

  def update_subtotal
    self[:subtotal] = subtotal
  end
  
end
