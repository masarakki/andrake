require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Andrake::Generator::Rakefile do

  describe ".check_file" do
    it "raise if Rakefile Exists" do
      lambda {
        Andrake::Generator::Rakefile.send(:check_file)
      }.should raise_error
    end
  end
  
  describe ".create_file" do
    it "open :rakefile with 'w' mode" do
      File.stub(:read) { 'string' }
      
      File.should_receive(:open).with(Andrake::Generator::Rakefile.send(:rakefile), 'w')
      Andrake::Generator::Rakefile.send(:create_file)
    end
  end
 
  describe ".run!" do
    it "check and create" do
      Andrake::Generator::Rakefile.should_receive(:check_file)
      Andrake::Generator::Rakefile.should_receive(:create_file)
      Andrake::Generator::Rakefile.run!
    end
  end
end
