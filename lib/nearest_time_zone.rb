require 'pathname'
require 'csv'
require 'kdtree'

require 'require_all'
require_rel './nearest_time_zone'

# Base Module
module NearestTimeZone
  def self.to(latitude, longitude)
    nearest_city = City.nearest(latitude, longitude)
    nearest_city && nearest_city.time_zone.name
  end

  def self.dump
    Dump.dump
    puts 'dumped!'
  end
end

# load the kdtree so that everything is fast
NearestTimeZone::City.kdtree
