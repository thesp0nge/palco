require 'spec_helper'

describe "When palco it's used to generate Sinatra extensions " do
  before(:all) do
    @extension = Palco::Extension.new('test_ext')
  end
  after (:all) do
    @extension.destroy
  end
  it "it must generate a valid skeleton" do  
    @extension.valid?.should      be_true
    @extension.generated?.should  be_false
    @extension.generate
    @extension.generated?.should  be_true
  end

  it "it must create a LICENSE file in target dir" do
    File.exists?("test_ext/README").should be_true
  end

  it "it must create a gemspec to pack the extensiokn" do
    File.exists?("test_ext/sinatra_test_ext.gemspec").should be_true
  end
end
