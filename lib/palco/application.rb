module Palco
  class Application < Palco::Base
   FILE_LIST = [
      {:name=>'README', :file=>true}, 
      {:name=>'LICENSE', :file=>true},
      {:name=>'Gemfile', :file=>true},
      {:name=>'app.rb', :file=>true},
      {:name=>'config.ru', :file=>true},
      {:name=>'conf', :file=>false},
      {:name=>'lib', :file=>false},
      {:name=>'lib/version.rb', :file=>true},
      {:name=>'spec', :file=>false},
      {:name=>'public', :file=>false},
      {:name=>'views', :file=>false},
      {:name=>'logs', :file=>false},
    ]
 
    # Public: creates a new Sinatra modular application skeleton.
    #
    # The directory layout is based only on my personal taste so feel free to
    # override Palco:Base with your own personal template or even suggest me
    # how to improve this one.
    #
    # What we absolutely need here is an app.rb file for the main code and a
    # lib directory for other auxiliary helpers.
    # We need a views directory for templates and a public directory for static
    # assests.
    # 
    # Since I love haml as template language I choose that as default.
    #
    # Example
    #   app = Palco::Application.new('a_new_app')
    #   app.generate
    #
    # Returns
    #   A new Sinatra modular application. Fire up rackup or shotgun and start
    #   hacking.
    def initialize(name)
      list = FILE_LIST

      list = list << {:name=>"lib/#{name}", :file=>false}
      list = list << {:name=>"spec/#{name}_spec.rb", :file=>true}

      super(name, list)


    end
    
  end
end
