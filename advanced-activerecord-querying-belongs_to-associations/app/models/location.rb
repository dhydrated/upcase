class Location < ActiveRecord::Base
  belongs_to :region
  has_many :people

  def self.in_region(region)
    joins(:region).merge(Region.in_region(region))
  end

  def self.order_by_name
    order(:name)
  end
end
