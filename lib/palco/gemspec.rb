module Palco
  class Gemspec < Palco::FileBase

    def initialize(root_dir)
      super(root_dir, "sinatra_#{root_dir}.gemspec")
      @file_content = "# -*- encoding: utf-8 -*-"
      @file_content << "$:.push File.expand_path(\"../lib\", __FILE__)\n"
      @file_content << "require \"palco/version\"\n"

      @file_content << "Gem::Specification.new do |s|\n"
      @file_content << "s.name        = \"#{root_dir}\"\n"
      @file_content << "s.version     = #{root_dir.capitalize}::VERSION\n"
      @file_content << "s.authors     = [\"#{self.user_name}\"]\n"
      @file_content << "s.email       = [\"#{self.email}\"]\n"
      @file_content << "s.homepage    = \"add your project homepage\"\n"
      @file_content << "s.summary     = %q{write a great summary here}\n"
      @file_content << "s.description = %q{write a great description here}\n"
      @file_content << "\n"
      @file_content << "s.rubyforge_project = \"#{root_dir}\"\n"
      @file_content << "\n"
      @file_content << "s.files         = `git ls-files`.split(\"\\n\")\n"
      @file_content << "s.test_files    = `git ls-files -- {test,spec,features}/*`.split(\"\\n\")\n"
      @file_content << "s.executables   = `git ls-files -- bin/*`.split(\"\\n\").map{ |f| File.basename(f) }\n"
      @file_content << "s.require_paths = [\"lib\"]\n"
      @file_content << "# specify any dependencies here; for example:\n"
      @file_content << "# s.add_development_dependency \"rspec\"\n"
      @file_content << "end\n"
    end
  end
end
