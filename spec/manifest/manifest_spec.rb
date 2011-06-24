require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Andrake::Manifest do
  before do
    @manifest_filename = File.expand_path(File.dirname(__FILE__) + '/AndroidManifest.xml')

    @manifest_xml = File.read(@manifest_filename)
  end

  describe "class methods" do
    subject { Andrake::Manifest }
    its(:manifest_file) { should eq("AndroidManifest.xml") }

    describe ".load" do
      before do
        Andrake::Manifest.stub(:manifest_file) { @manifest_filename }
      end
      it "should create instance with contents of xml file" do
        subject.should_receive(:new).with(@manifest_xml)
        subject.load
      end
    end
  end

  describe "instance methods" do
    before do
      Andrake::Manifest.stub(:manifest_file) { @manifest_filename }
    end

    subject { Andrake::Manifest.new(@manifest_xml) }
    describe "#save" do
      after do
        File.open(@manifest_filename, 'w') do |f|
          f.write @manifest_xml
        end
      end

      it "should be equal to src file" do
        subject.save
        Nokogiri::XML(File.read(@manifest_filename)).to_s.should eq(subject.instance_variable_get(:@document).to_s)
      end
    end
  end
end
