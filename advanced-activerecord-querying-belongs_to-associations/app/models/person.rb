class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.in_region(region)
    joins(:location).merge(Location.in_region(region))
  end

  def self.alphabetically_by_region_and_location
    joins(location: :region).
      merge(Region.order_by_name).
      merge(Location.order_by_name).
      merge(order_by_name)
  end

  def self.order_by_name
    order(:name)
  end
end
