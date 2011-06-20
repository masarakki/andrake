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
end
