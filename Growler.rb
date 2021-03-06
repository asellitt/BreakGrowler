
require 'ruby-growl'
require 'ruby-growl/ruby_logo'

class Growler
   
   def initialize(host, application)
      # initialise Growl
      @growl = Growl.new(host, application);
   end
   
   def register(title)
      @growl.add_notification("#{title} notification", "#{title} Notification", Growl::RUBY_LOGO_PNG)
   end
   
   def notify(title, message)
      # default the priority, make the notification sticky
      priority = 0 
      sticky = true
      
      @growl.notify("#{title} notification", title, message, priority, sticky)
   end
end