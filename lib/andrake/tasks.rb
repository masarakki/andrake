require 'rake'
require 'rake/tasklib'

class Rake::Application
  def andrake

  end
end

class Andrake::Tasks < ::Rake::TaskLib
  def initialize
    define
  end

  private
  def define
    namespace :version do
      namespace :bump do
        desc "bump major version"
        task :major do
          manifest = Andrake::Manifest.load.bump_major!
          puts "major update to #{manifest.version}"
        end

        desc "bump minor version"
        task :minor do
          manifest = Andrake::Manifest.load.bump_minor!
          puts "minor update to #{manifest.version}"
        end

        desc "bump patch version"
        task :patch do
          manifest = Andrake::Manifest.load.bump_patch!
          puts "patch update to #{manifest.version}"
        end
      end
    end
  end
end
