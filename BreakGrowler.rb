require 'rufus/scheduler'

require_relative 'AppConfig'
require_relative 'Growler'

if __FILE__ == $PROGRAM_NAME
   puts 'BreakGrowler started'
   
   config = AppConfig.new('config.yml')  
   puts 'config loaded'
   
   growler = Growler.new(
         config.settings['growl']['host'], 
         config.settings['growl']['application']
   );
   puts 'growler initialised'
   
   # register the breaks
   config.settings['breaks'].each { |x| 
      puts "registering #{x['title']}"
      growler.register(x['title'])
   }
   
   scheduler = Rufus::Scheduler.start_new
   puts 'scheduler started'
   
   # schedule the notifications
   config.settings['breaks'].each { |x| 
      puts "scheduling: #{x['title']} (every #{x['interval']})"
      
      scheduler.every x['interval'] do
         puts "sending notification: #{x['title']}"
         growler.notify(x['title'], x['message'])
      end
   }
   
   # ensure that this doesnt exit unless forced to
   scheduler.join
end