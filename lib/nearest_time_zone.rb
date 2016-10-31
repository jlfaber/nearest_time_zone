require 'csv'
require 'kdtree'

require_relative 'nearest_time_zone/city.rb'
require_relative 'nearest_time_zone/dump.rb'
require_relative 'nearest_time_zone/railtie.rb'
require_relative 'nearest_time_zone/time_zone.rb'
require_relative 'nearest_time_zone/version.rb'

# Top level module
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
