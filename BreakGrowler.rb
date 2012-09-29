
require 'ruby-growl'
require 'ruby-growl/ruby_logo'
require_relative 'AppConfig'

if __FILE__ == $PROGRAM_NAME
   g = Growl.new("localhost", "ruby-growl")
   g.add_notification("notification", "ruby-growl Notification", Growl::RUBY_LOGO_PNG)
   g.notify("notification", "It came from ruby-growl", "Greetings!")
   
   config = AppConfig.new('config.yml')  
   
   puts config.settings['growl']['host']
   puts config.settings['growl']['application']
   config.settings['breaks'].each { |x| puts x['title'] }

end