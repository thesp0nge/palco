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
      {:name=>'spec/spec_helper.rb', :file=>true},

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
      @r = name
      list = FILE_LIST

      list = list << {:name=>"lib/#{name}", :file=>false}
      list = list << {:name=>"spec/#{name}_spec.rb", :file=>true}

      super(name, list)


    end

    def generate
      super
      license = Palco::License.new(@r)
      license.create

      file = Palco::FileBase.new(@r, "lib/#{@r}/version.rb")
      file.file_content = "module #{@r.capitalize}\nVERSION=\"0.0.0\"\nend\n"
      file.create

      file = Palco::FileBase.new(@r, "spec/spec_helper.rb")
      file.file_content = "require '#{@r}'\n"
      file.create


      file = Palco::FileBase.new(@r, "app.rb")
      file.file_content = "require 'sinatra/base'\nclass #{@r.capitalize} < Sinatra::Base\n# ... app code here ... \n\n # start the server if execute this file directly\n run! if app_file == $0\nend\n"
      file.create

      file = Palco::FileBase.new(@r, "config.ru")
      file.file_content = "require './app'\nlog = File.new(\"logs/#{@r}.log\", \"a\")\nSTDOUT.reopen(log)\nSTDERR.reopen(log)\nrun #{@r.capitalize}::App\n"
      file.create


    end

  end
end
