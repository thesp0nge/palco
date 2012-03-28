require 'spec_helper'

describe "When palco it's used to generate Sinatra applications" do
  before(:all) do
    @extension = Palco::Application.new('test_app')
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
    File.exists?("test_app/README").should be_true
  end

  it "it must create a Gemfile file in target dir" do
    File.exists?("test_app/Gemfile").should be_true
  end

  it "it must create a app.rb file in target dir" do
    File.exists?("test_app/app.rb").should be_true
  end
  it "it must create a config.ru file in target dir" do
    File.exists?("test_app/config.ru").should be_true
  end
  it "it must create a lib directory in target dir" do
    File.directory?("test_app/lib").should be_true
  end
  it "it must create a public directory in target dir" do
    File.directory?("test_app/public").should be_true
  end
  it "it must create a views directory in target dir" do
    File.directory?("test_app/views").should be_true
  end
  it "it must create a logs directory in target dir" do
    File.directory?("test_app/logs").should be_true
  end
end
