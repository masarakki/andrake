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
      template_result = File.read(File.join(template_dir, rakefile))
      File.open(rakefile, 'w') {|file| file.write(template_result) }
    end
    
    def rakefile ; 'Rakefile' ; end
    def template_dir ; File.expand_path(File.dirname(__FILE__) + '/../templates') ; end
  end
end
