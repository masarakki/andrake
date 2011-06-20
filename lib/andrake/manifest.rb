require 'nokogiri'
class Andrake::Manifest
  autoload :Version, 'andrake/manifest/version'
  ManifestFile = 'AndroidManifest.xml'

  class << self
    def manifest_file ; ManifestFile ; end
    def load ; new File.read(manifest_file) ; end
  end

  def initialize(xml)
    @document = ::Nokogiri::XML(xml)
  end


  include Version
end
