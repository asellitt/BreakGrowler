
require 'ruby-growl'
require 'ruby-growl/ruby_logo'

g = Growl.new "localhost", "ruby-growl"
g.add_notification("notification", "ruby-growl Notification",
                   Growl::RUBY_LOGO_PNG)
g.notify "notification", "It came from ruby-growl", "Greetings!"