require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Andrake::Manifest do
  before do
    @manifest = File.read(File.expand_path(File.dirname(__FILE__) + '/AndroidManifest.xml'))
  end

  describe "class methods" do
    subject { Andrake::Manifest }
    its(:manifest_file) { should eq("AndroidManifest.xml") }

    describe ".load" do
      before do
        @manifest_file = File.expand_path(File.dirname(__FILE__) + '/AndroidManifest.xml')
        Andrake::Manifest.stub(:manifest_file) { @manifest_file }
      end
      it "should create instance with contents of xml file" do
        subject.should_receive(:new).with(File.read(@manifest_file))
        subject.load
      end
    end
  end

  describe "instance methods" do
    subject { Andrake::Manifest.new(@manifest) }
    its(:version) { "0.8.1" }
    its(:version_major) { should eq(0) }
    its(:version_minor) { should eq(8) }
    its(:version_patch) { should eq(1) }
    its(:version_code) { should eq(25) }
  end
end
