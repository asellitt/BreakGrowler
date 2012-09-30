
require 'ruby-growl'
require 'ruby-growl/ruby_logo'
require_relative 'AppConfig'
require_relative 'Growler'

if __FILE__ == $PROGRAM_NAME
   config = AppConfig.new('config.yml')  
   growler = Growler.new(
         config.settings['growl']['host'], 
         config.settings['growl']['application']
   );
   
   # register the breaks
   config.settings['breaks'].each { |x| 
      growler.register(x['title'])
   }
   
   # send the notifications
   config.settings['breaks'].each { |x| 
      growler.notify(x['title'], x['message'])
   }
end