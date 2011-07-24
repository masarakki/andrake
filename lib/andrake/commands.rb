class Andrake::Commands
  def parse(argv = nil)
    return {:command => "new"} if argv.nil?
    command = argv.shift
    command = aliases[command] || command
    {:command => command}
  end

  def aliases
    {"g" => "generate", "d" => "destroy" }
  end

  def run(argv)
    command = parse(argv)
    case command[:command]
    when 'generate'
      puts 'generate'
    when 'destroy'
      puts 'destroy'
    when 'new'
      Andrake::Generator::Rakefile.run!
    else
      puts "hogehoge"
    end
  end

  class << self
    def run!(argv)
      self.new.run(argv)
    end
  end
end
