require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Andrake::Manifest do
  before(:all) do
    @manifest = File.read(File.expand_path(File.dirname(__FILE__) + '/AndroidManifest.xml'))
  end

  subject { Andrake::Manifest.new(@manifest) }
  its(:version) { "0.8.1" }
  its(:version_major) { should eq(0) }
  its(:version_minor) { should eq(8) }
  its(:version_patch) { should eq(1) }
  its(:version_code) { should eq(25) }

  describe "#bump_major" do
    subject do
      manifest = Andrake::Manifest.new(@manifest)
      manifest.bump_major
      manifest
    end

    its(:version_major) { should eq(1) }
    its(:version_minor) { should eq(0) }
    its(:version_patch) { should eq(0) }
    its(:version_code) { should eq(26) }
  end

  describe "#bump_minor" do
    before(:all) do
      @manifest = Andrake::Manifest.new(@manifest)
      @manifest.bump_minor
    end

    subject { @manifest }

    its(:version_major) { should eq(0) }
    its(:version_minor) { should eq(9) }
    its(:version_patch) { should eq(0) }
    its(:version_code) { should eq(26) }
  end

  describe "#bump_patch" do
    subject do
      manifest = Andrake::Manifest.new(@manifest)
      manifest.bump_patch
      manifest
    end

    its(:version_major) { should eq(0) }
    its(:version_minor) { should eq(8) }
    its(:version_patch) { should eq(2) }
    its(:version_code) { should eq(26) }
  end
end
