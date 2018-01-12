require 'geokit-rails'

class Spot < ApplicationRecord
  before_save :geocode, on: [ :create, :update ]
  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  private

  def geocode
    if self.address.present?
      spot = Geokit::Geocoders::GoogleGeocoder.geocode(address)
      ll = spot.ll.split(',')
      self.latitude = ll[0]
      self.longitude = ll[1]
    end
  end

end
