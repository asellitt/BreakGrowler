require 'rufus/scheduler'

require_relative 'AppConfig'
require_relative 'Growler'

if __FILE__ == $PROGRAM_NAME
   config = AppConfig.new('config.yml')  
   growler = Growler.new(
         config.settings['growl']['host'], 
         config.settings['growl']['application']
   );
   scheduler = Rufus::Scheduler.start_new
   
   # register the breaks
   config.settings['breaks'].each { |x| 
      growler.register(x['title'])
   }
   
   # schedule the notifications
   config.settings['breaks'].each { |x| 
      scheduler.every x['interval'] do
         growler.notify(x['title'], x['message'])
      end
   }
   
   # ensure that this doesnt exit unless forced to
   scheduler.join
end