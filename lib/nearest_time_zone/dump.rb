module NearestTimeZone
  # Dump utility
  class Dump
    DATA_DIR = Pathname.new(__FILE__).dirname + '../../data'.freeze

    def self.dump
      File.open(DATA_DIR + 'cities.dump', 'wb') do |f|
        f.write Marshal.dump(City.all)
      end
      File.open(DATA_DIR + 'time_zones.dump', 'wb') do |f|
        f.write Marshal.dump(TimeZone.all)
      end
      File.open(DATA_DIR + 'kdtree.dump', 'wb') do |f|
        City.kdtree.persist(f)
      end
    end
  end
end
