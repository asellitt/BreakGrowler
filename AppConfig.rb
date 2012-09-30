class AppConfig
   require 'yaml'
   
   attr_reader :settings
   
   def initialize(config)
      @settings = YAML.load_file(config)
      
      @settings['breaks'].each_index{ |index| 
         # translate the time entries
         translateTime!(index, 'duration')
         translateTime!(index, 'interval')
      }
      
      puts @settings.inspect
   end

   private
   def translateTime!(index, entry)
      # retrieve the value
      value = @settings['breaks'][index]
      
      # parse out the important parts
      time, unit = value[entry][/[0-9]*/], value[entry][/[a-z]/]
      
      # store them in the settings
      @settings['breaks'][index][entry] = {}
      @settings['breaks'][index][entry]['time'] = time.to_i
      @settings['breaks'][index][entry]['unit'] = unit
   end
end