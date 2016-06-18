#require 'pages/staff/staff_base_page'
#require 'pages/visitor/visitor_base_page'
#require 'pages/visitor/visitor_common_page'



#Dir["#{File.dirname(__FILE__)}/pages/*/*_page.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*_page.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*_pop_up.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*/*_page.rb"].each {|r| load r }
Dir["#{File.dirname(__FILE__)}/pages/*/*_pop_up.rb"].each {|r| load r }

