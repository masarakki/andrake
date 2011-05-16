class Andrake::Generator::Rakefile
  class << self
    
    def run!
      check_file
      create_file
    end
    
    private
    def check_file
      raise if File.exists?(rakefile)
    end
    
    def create_file
    end
    
    def rakefile ; 'Rakefile' ; end
  end
end
