module Andrake::Manifest::Version
  def version
    @version ||= load_version
  end

  def version_major
    load_version unless @version_major
    @version_major
  end

  def version_minor
    load_version unless @version_minor
    @version_minor
  end

  def version_patch
    load_version unless @version_patch
    @version_patch
  end

  def version_code
    @version_code ||= @document.xpath('/manifest').first["versionCode"].to_i
  end

  private
  def load_version
    @version_major, @version_minor, @version_patch = @document.xpath('/manifest').first["versionName"].split(/\./).map(&:to_i)
  end
end
