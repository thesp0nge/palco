module Palco
  # Public: models the LICENSE file. Since I like it, I choose the new BSD
  # License as reference.
  #
  # It's approved for opensource projects: http://www.opensource.org/licenses/BSD-3-Clause
  # 
  # Information about author are retrieved using Git rubygem to global
  # configuration. 
  #
  # Examples:
  #   license = Palco::License.new('test')
  #   license.create #=> creates a test/LICENSE file containing the 3 clause BSD license
  #   license.new_bsd? #=> true
  class License < Palco::FileBase

    attr_reader :organization_name

    def initialize(root_dir, organization_name="")
      super(root_dir, "LICENSE")
      @file_content = "Copyright (c) #{Time.now.year}, #{self.user_name} - <#{self.email}>\n"
      @file_content << "All rights reserved.\n\n"
      @file_content << "Redistribution and use in source and binary forms, with or without\n"
      @file_content << "modification, are permitted provided that the following conditions are met:\n"
      @file_content << "    * Redistributions of source code must retain the above copyright\n"
      @file_content << "      notice, this list of conditions and the following disclaimer.\n"
      @file_content << "    * Redistributions in binary form must reproduce the above copyright\n"
      @file_content << "      notice, this list of conditions and the following disclaimer in the\n"
      @file_content << "      documentation and/or other materials provided with the distribution.\n"
      @file_content << "    * Neither the name of the #{@organization_name} nor the\n"
      @file_content << "      names of its contributors may be used to endorse or promote products\n"
      @file_content << "      derived from this software without specific prior written permission.\n\n"
      @file_content << "THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\" AND\n"
      @file_content << "ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED\n"
      @file_content << "WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE\n"
      @file_content << "DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY\n"
      @file_content << "DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES\n"
      @file_content << "(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;\n"
      @file_content << "LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND\n"
      @file_content << "ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT\n"
      @file_content << "(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS\n"
      @file_content << "SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.\n"

      @organization_name = organization_name
    end

    def new_bsd?
      return self.find(@file_content)
    end
  end
end
