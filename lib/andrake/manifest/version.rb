module Andrake::Manifest::Version
  def version
    [version_major, version_minor, version_patch].join(".")
  end

  def bump_major
    self.version_major += 1
    self.version_minor = 0
    self.version_patch = 0
    self.version_code += 1
    self
  end

  def bump_minor
    self.version_minor += 1
    self.version_patch = 0
    self.version_code += 1
    self
  end

  def bump_patch
    self.version_patch += 1
    self.version_code += 1
    self
  end

  def update_version
    manifest["android:versionName"] = version.to_s
    manifest["android:versionCode"] = version_code.to_s
    self
  end

  [:major, :minor, :patch].each do |element|
    define_method("bump_#{element}!".to_sym) do
      send("bump_#{element}".to_sym).update_version.save
      self
    end
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

  private
  def manifest
    @manifest ||= @document.xpath('/manifest').first
  end

  def load_version
    @version_major, @version_minor, @version_patch = manifest["versionName"].split(/\./).map(&:to_i) + [0, 0, 0]
    @version_code = manifest["versionCode"].to_i
    true
  end
end

