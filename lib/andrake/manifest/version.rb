module Andrake::Manifest::Version
  def version
    [version_major, version_minor, version_patch].join(".")
  end

  def bump_major
    self.version_major += 1
    self.version_minor = 0
    self.version_patch = 0
    self.version_code += 1
  end

  def bump_minor
    self.version_minor += 1
    self.version_patch = 0
    self.version_code += 1
  end

  def bump_patch
    self.version_patch += 1
    self.version_code += 1
  end

  [:major, :minor, :patch, :code].each do |element|
    val_name = "@version_#{element}".to_sym

    define_method("version_#{element}".to_sym) do
      load_version unless instance_variable_get(val_name)
      instance_variable_get(val_name)
    end

    define_method("version_#{element}=".to_sym) do |val|
      instance_variable_set(val_name, val)
      val
    end

    protected "version_#{element}=".to_sym
  end

  def load_version
    manifest = @document.xpath('/manifest').first
    @version_major, @version_minor, @version_patch = manifest["versionName"].split(/\./).map(&:to_i) + [0, 0, 0]
    @version_code = manifest["versionCode"].to_i
    true
  end
end
