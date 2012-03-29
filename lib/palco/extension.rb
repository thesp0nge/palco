module Palco
  class Extension < Palco::Base
    FILE_LIST = [
      {:name=>'README', :file=>true}, 
      {:name=>'LICENSE', :file=>true},
      {:name=>'Rakefile', :file=>true},
      {:name=>'lib', :file=>false},
      {:name=>'lib/sinatra', :file=>false}, 
      {:name=>'spec', :file=>false},
      {:name=>'spec/spec_helper', :file=>true},
      {:name=>'LICENSE', :file=>true},
    ]

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

    def initialize(name)
      @r = name
      list = FILE_LIST 
      list = list << {:name=>"lib/sinatra/#{name}.rb", :file=>true}
      list = list << {:name=>"spec/sinatra_#{name}_spec.rb", :file=>true}
      list = list << {:name=>"sinatra_#{name}.gemspec", :file=>true}

      super(name, list)
    end

    def generate
      super
      puts "AAAA #{@r}"

      license = Palco::License.new(@r)
      license.create

    end

  end
end
