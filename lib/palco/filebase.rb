require 'git'

module Palco

  # Public: this is a generic file class used to provide some common methods
  # such as writing contents in a text file or reading or comparing a content.
  class FileBase

    
    attr_reader :root_dir
    attr_reader :user_name
    attr_reader :email
    attr_reader :full_path_name

    def initialize(root_dir, name)
      @full_path_name = File.join(Dir.pwd, root_dir, name)
      conf = Git.global_config
      @user_name  = conf["user.name"]
      @email      = conf["user.email"]

    end

    def exists?
      File.exists?(@full_path_name)
    end

    def read
      f= File.open(@full_path_name)
      content = f.read
      content
    end

    def write(content)
      begin
        f=File.open(@full_path_name, "w")
        f.write(content)
        f.close
        true
      rescue Exception
        false
      end

    end

    def inject(string)

    end

    def find(string)
      text = self.read
      text.include?(string)
    end

    # Public: creates a new file. 
    #
    # Palco::File.create however is just a stub... every specialized class must
    # implement this method accordingly with the content they file deserve to.
    #
    # Example
    #   file = Palco::File.new('test', 'a_file')
    #   a.create
    # 
    # Returns
    #   Returns true if the file can be created with the proper content or
    #   false otherwise
    def create
      true
    end
  end
end
