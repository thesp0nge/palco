require 'fileutils'
# Public: the base palco skelethon builder.
#
# Ideally it will never called directly but it will be subclassed by
# Palco::Extension and Palco::Application
#
# Examples:
#
#   base = Palco::Base.new('a_test', [{:name=>'README', :file=>true}, {:name=>'lib', :file=>false}])
#   base.generate
#
module Palco
  class Base

    # Public: creates a new base palco instance. 
    #
    # The idea is that specialized classes extending Palco::Base will be aware
    # about the list of files and directories to be created, meanwhile the
    # Palco::Base takes this list without any clue about their meaning.
    # 
    # name - the name of the Sinatra project
    # items_list - an array containing a list of hashes with name of the file to
    #   be created and a second param telling the code code it the item is either
    #   a file or a directory.
    # 
    # Example
    #
    #   base = Palco::Base.new('test_one',[{:name=>'README', :file=>true}, {:name=>'lib', :file=>false}]) 
    # Returns
    #   A new Palco::Base object 

    attr_reader :project_name
    attr_reader :items_list
    attr_reader :valid
    attr_reader :generated

    def initialize(name=nil, items_list=[])
      @project_name = name
      @items_list = items_list
      @generated = false

      if @project_name.nil? or @items_list.size==0
        @valid = false
      else
        @valid = true
      end
    end
    
    # Public: generates the skelethon
    #
    # Example
    #   base = Palco::Base.new('test_one',[{:name=>'README', :file=>true}, {:name=>'lib', :file=>false}]) 
    #   base.generate
    #
    # Returns
    #   True if every item in the item list has been created of false otherwise.
    #
    def generate
      FileUtils.mkdir(File.join(Dir.pwd, @project_name))

      @items_list.each do |item|
        fullname = File.join(Dir.pwd, @project_name, item[:name])
        isfile = item[:file]
        if isfile 
          FileUtils.touch(fullname)
        else
          FileUtils.mkdir(fullname)
        end
      end
      @generated = true
      return true

    end

    # Public: destroy the skelethon removing all files and all directories.
    #   Also the base directory has been removed as well.
    #
    # Please note that you're not supposed to call destroy for a non generated
    # skelethon. The method returns false in this case.
    #
    # Example
    #   base = Palco::Base.new('test_one',[{:name=>'README', :file=>true}, {:name=>'lib', :file=>false}]) 
    #   base.generate
    #   base.destroy
    # 
    # Returns
    #   True if all items in the item list has been removed or false otherwise.
    #   
    def destroy
      if ! self.generated?
        return false
      end
      FileUtils.rm_rf(@project_name)
      @valid = false
      @generated= false
      true
    end

    def can_generate?
      ! File.directory?(File.join(Dir.pwd, @project_name))
    end

    def valid?
      return self.valid
    end

    def generated?
      return self.generated
    end

  end
end
