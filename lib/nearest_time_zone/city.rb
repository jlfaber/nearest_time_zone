module NearestTimeZone
  # City class
  class City
    DATA_DIR = Pathname.new(__FILE__).dirname + '../../data'.freeze

    attr_accessor :id, :latitude, :longitude, :time_zone_id

    def initialize(id, latitude, longitude, time_zone_id)
      self.id           = id
      self.latitude     = latitude
      self.longitude    = longitude
      self.time_zone_id = time_zone_id
    end

    def self.kdtree
      @kdtree ||= build_kdtree
    end

    def id=(value)
      @id = value.to_i
    end

    def latitude=(value)
      @latitude = value.to_f
    end

    def longitude=(value)
      @longitude = value.to_f
    end

    def self.all
      @all ||= load_all
    end

    def self.find(id)
      all[id.to_i]
    end

    def self.nearest(latitude, longitude)
      all[kdtree.nearest(latitude, longitude)]
    end

    def time_zone
      TimeZone.find(time_zone_id)
    end

    private_class_method def self.load_all
      Marshal.load(File.read(DATA_DIR + 'cities.txt'))
    rescue
      cities = CSV.open(DATA_DIR + 'cities.txt')
      Hash[
        cities.collect do |city|
          [city[0].to_i, City.new(*(0..3).collect { |n| city[n] })]
        end
      ]
    end

    private_class_method def self.build_kdtree
      File.open(DATA_DIR + 'kdtree.dump') { |f| Kdtree.new(f) }
    rescue
      Kdtree.new all.collect do |_id, city|
        [city.latitude, city.longitude, city.id]
      end
    end
  end
end
