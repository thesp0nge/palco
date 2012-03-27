module Palco
  class Extension < Palco::Base

    # Public: creates a new Sinatra Extension skeleton
    #
    # The idea is to pack the extension as a rubygem as described here:
    # http://www.sinatrarb.com/extensions.html
    #
    # Example
    #   ext = Palco::Extension.new('testme')
    #   ext.generate
    #
    # Returns
    #   A new Sinatra extension directory read to be packed as a rubygem

    FILE_LIST = [
      {:name=>'README', :file=>true}, 
      {:name=>'LICENSE', :file=>true},
      {:name=>'Rakefile', :file=>true},
      {:name=>'lib', :file=>false},
      {:name=>'lib/sinatra', :file=>false}, 
      {:name=>'test', :file=>false},
      {:name=>'LICENSE', :file=>true},
    ]
    def initialize(name)
      list = FILE_LIST 
      list = list << {:name=>"lib/sinatra/#{name}.rb", :file=>true}
      list = list << {:name=>"test/spec_sinatra_#{name}.rb", :file=>true}
      list = list << {:name=>"sinatra_#{name}.gemspec", :file=>true}

      super(name, list)
    end

  end
end
