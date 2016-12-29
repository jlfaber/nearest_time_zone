module NearestTimeZone
  # timezone class
  class TimeZone
    DATA_DIR = Pathname.new(__FILE__).dirname + '../../data'.freeze

    attr_accessor :id, :name

    def initialize(id, name)
      self.id = id
      self.name = name
    end

    def id=(value)
      @id = value.to_i
    end

    def self.all
      @all ||= load_all
    end

    def self.find(id)
      all[id.to_i]
    end

    private_class_method def self.load_all
      Marshal.load(File.read(DATA_DIR + 'time_zones.dump'))
    rescue
      time_zones = CSV.open(DATA_DIR + 'time_zones.txt')
      Hash[
        time_zones.collect do |time_zone|
          [time_zone[0].to_i, TimeZone.new(time_zone[0].to_i, time_zone[1])]
        end
      ]
    end
  end
end
