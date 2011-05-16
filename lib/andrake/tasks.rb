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
        task :major do
          puts 'major update'
        end
        
        task :minor do
          puts 'minor update'
        end

        task :patch do
          puts 'patch update'
        end
      end
    end
  end
end
