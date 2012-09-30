
require 'ruby-growl'
require 'ruby-growl/ruby_logo'

class Growler
   
   def initialize(host, application)
      # initialise Growl
      @growl = Growl.new(host, application);
      @application = application;
   end
   
   def register(title)
      @growl.add_notification("#{title} notification", "#{@application} Notification", Growl::RUBY_LOGO_PNG)
   end
   
   def notify(title, message)
      @growl.notify("#{title} notification", title, message, 0, true)
   end
end