class AppConfig
   require 'yaml'
   
   attr_reader :settings
   
   def initialize(config)
      @settings = YAML.load_file(config)
   end
end