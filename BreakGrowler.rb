
require 'ruby-growl'
require 'ruby-growl/ruby_logo'
require_relative 'AppConfig'

if __FILE__ == $PROGRAM_NAME
   config = AppConfig.new('config.yml')  
   
   puts config.settings['growl']['host']
   puts config.settings['growl']['application']
   config.settings['breaks'].each { |x| puts x['title'] }
   
   # growl for each break
   g = Growl.new(config.settings['growl']['host'], config.settings['growl']['application'])
   config.settings['breaks'].each { |x| 
      # register notification
      g.add_notification(x['title'] + 'notification', config.settings['growl']['application'] + ' Notification', Growl::RUBY_LOGO_PNG) 
   }
   
   config.settings['breaks'].each { |x| 
      # get time for each break
      puts "interval: #{x['interval']['time']} #{x['interval']['unit']}"
      puts "duration: #{x['duration']['time']} #{x['duration']['unit']}"
      
      g.notify(x['title'] + 'notification', x['title'], x['message'])
   }
end