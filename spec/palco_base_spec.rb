require 'spec_helper'

describe "Palco::Base package " do
  
  before(:all) do
    @base = Palco::Base.new('test_one', [{:name=>'README', :file=>true}, {:name=>'a_directory', :file=>false}])
  end

  it "creates a project named 'test_one'" do
    @base.project_name.should == "test_one"
    @base.valid?.should be_true
    @base.generate.should be_true
    File.directory?("test_one").should be_true
  end

  it "creates a README file in 'test_one' directory" do
    File.exists?("test_one/README").should be_true
  end

  it "creates a directory called 'a_directory' inside 'test_one'" do
    File.directory?("test_one/a_directory").should be_true
  end

  it "removes all if destroy method has been called" do
    @base.destroy
    @base.valid?.should be_false
    File.directory?("test_one").should be_false
    File.exists?("test_one/README").should be_false
    File.directory?("test_one/a_directory").should be_false
  end

  it "cannot remove a skelethon that it has not been generated before" do
    @base = Palco::Base.new('test_two', [{:name=>'README', :file=>true}, {:name=>'a_directory', :file=>false}])
    File.directory?("test_one").should be_false
    File.exists?("test_one/README").should be_false
    File.directory?("test_one/a_directory").should be_false
    @base.destroy.should be_false
  end

  it "must provide an handy generated? handler telling that everything is ok" do
    @base = Palco::Base.new('test_three', [{:name=>'README', :file=>true}, {:name=>'a_directory', :file=>false}])
    @base.generated?.should be_false
    @base.generate
    File.directory?("test_one").should be_true
    File.exists?("test_one/README").should be_true
    File.directory?("test_one/a_directory").should be_true
    @base.generated?.should be_true


  end
end
