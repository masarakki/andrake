require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Andrake::Manifest do
  before(:all) do
    @manifest_file = File.read(File.expand_path(File.dirname(__FILE__) + '/AndroidManifest.xml'))
  end

  before do
    @manifest = Andrake::Manifest.new(@manifest_file)
  end

  subject { @manifest }
  its(:version) { "0.8.1" }
  its(:version_major) { should eq(0) }
  its(:version_minor) { should eq(8) }
  its(:version_patch) { should eq(1) }
  its(:version_code) { should eq(25) }

  describe "#bump_major" do
    subject { @manifest.bump_major }

    it { should eq(@manifest) }
    its(:version_major) { should eq(1) }
    its(:version_minor) { should eq(0) }
    its(:version_patch) { should eq(0) }
    its(:version_code) { should eq(26) }
  end

  describe "#bump_minor" do
    subject { @manifest.bump_minor }

    it { should eq(@manifest) }
    its(:version_major) { should eq(0) }
    its(:version_minor) { should eq(9) }
    its(:version_patch) { should eq(0) }
    its(:version_code) { should eq(26) }
  end

  describe "#bump_patch" do
    subject { @manifest.bump_patch }

    it { should eq(@manifest) }
    its(:version_major) { should eq(0) }
    its(:version_minor) { should eq(8) }
    its(:version_patch) { should eq(2) }
    its(:version_code) { should eq(26) }
  end

  describe "#load_version reload version elements from Nokogiri instance" do
    subject do
      @manifest.bump_patch
      @manifest.send(:load_version)
      @manifest
    end

    its(:version_major) { should eq(0) }
    its(:version_minor) { should eq(8) }
    its(:version_patch) { should eq(1) }
    its(:version_code) { should eq(25) }
  end

  describe "#update set version elements to Nokogiri instance" do
    subject do
      @manifest.bump_patch.update_version
      @manifest.send(:load_version)
      @manifest
    end

    its(:version_major) { should eq(0) }
    its(:version_minor) { should eq(8) }
    its(:version_patch) { should eq(2) }
    its(:version_code) { should eq(26) }
  end

  describe "bump_version and save xml" do
    subject { @manifest }
    it "should recieve bump, update_version, save" do
      @manifest.should_receive(:bump_patch).ordered { @manifest }
      @manifest.should_receive(:update_version).ordered { @manifest }
      @manifest.should_receive(:save).ordered { true }
      @manifest.bump_patch!.should be_true
    end
  end
end
