class Region < ActiveRecord::Base
  has_many :locations

  def self.in_region(keyword)
    where(name: keyword)
  end

  def self.order_by_name
    order(:name)
  end
end
