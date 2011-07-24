require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Andrake::Commands do
  subject { Andrake::Commands.new }
  its(:aliases) { should == {"g" => "generate", "d" => "destroy" } }
  its(:parse) { should == {:command => "new"} }
  describe 'parse ["generate"]' do
    example { subject.parse(["generate"]).should == {:command => "generate"} }
  end
  describe 'parse(["g"])' do
    example { subject.parse(["g"]).should == {:command => "generate"} }
  end

end
