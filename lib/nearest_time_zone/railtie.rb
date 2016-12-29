if defined?(Rails)

  module NearestTimeZone
    # railtie class
    class Engine < Rails::Railtie
      railtie_name :nearest_time_zone

      rake_tasks do
        load 'tasks/nearest_time_zone_tasks.rake'
      end
    end
  end

end
