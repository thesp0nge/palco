module Palco
  class Extension < Palco::Base
    FILE_LIST = [
      {:name=>'README', :file=>true}, 
      {:name=>'LICENSE', :file=>true},
      {:name=>'Rakefile', :file=>true},
      {:name=>'lib', :file=>false},
      {:name=>'lib/sinatra', :file=>false}, 
      {:name=>'spec', :file=>false},
      {:name=>'spec/spec_helper.rb', :file=>true},
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
      list = list << {:name=>"lib/sinatra/version.rb", :file=>true}
      list = list << {:name=>"spec/sinatra_#{name}_spec.rb", :file=>true}
      list = list << {:name=>"sinatra_#{name}.gemspec", :file=>true}

      super(name, list)
    end

    def generate
      super
      license = Palco::License.new(@r)
      license.create
      gemspec = Palco::Gemspec.new(@r)
      gemspec.create

      file = Palco::FileBase.new(@r, "lib/sinatra/version.rb")
      file.file_content = "module #{@r.capitalize}\nVERSION=\"0.0.0\"\nend\n"
      file.create

      file = Palco::FileBase.new(@r, "spec/spec_helper.rb")
      file.file_content = "require '#{@r}'\n"
      file.create

      file = Palco::FileBase.new(@r, "lib/sinatra/#{@r}.rb")
      file.file_content ="require 'sinatra/base'\n\nmodule Sinatra\nmodule #{@r.capitalize}\nend\nregister #{@r}\nend\n"
      file.create

     
    end

  end
end
