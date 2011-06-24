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

  def save
    File.open(self.class.manifest_file, 'w') do |f|
      @document.write_xml_to f
    end
  end

  include Version
end
