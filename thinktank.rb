require_relative 'startupidea'

class Thinktank
  attr_accessor :startupideas

  EXAMPLE_STARTUP_IDEA_HASH = {
    :Name => "Facial Robot",
    :Description => "A robot that scans your face and applies the right daily skincare for you."
  }

  GREAT_IDEA_KEYWORDS = [
    "AI",
    "ML",
    "Blockchain",
    "Meta",
    "Quantum",
    "Cyber",
    "Robot"
  ]

  def initialize
    @startupideas = []
    puts
    puts 'Welcome to Insufferable Tech Bro Thinktank!'
  end

  def run
    loop do
      puts
      puts 'Options:'
      puts '1. Example Startup Idea'
      puts '2. Add Startup Idea'
      puts '3. View Startup Ideas'
      puts '4. Exit'

      case gets.chomp.to_i
      when 1
        example_startup_idea
      when 2
        add_startup_idea
      when 3
        view_startup_ideas
      when 4
        puts 'Get rich brah!'
        break
      else
        puts 'Try again.'
      end
    end
  end

  def example_startup_idea
    EXAMPLE_STARTUP_IDEA_HASH.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  def add_startup_idea
    print "Enter name of idea: "
    name = gets.chomp
    print "Enter description: "
    description = gets.chomp
    @startupideas << StartupIdea.new(name, description)

    puts
    if GREAT_IDEA_KEYWORDS.any? { |keyword| name.include? keyword }
      puts "#{name} is a rad idea, brah."
    else
      puts "#{name} sounds lame."
    end
  end

  def view_startup_ideas
    if @startupideas.empty?
      puts "No ideas added yet."
      return
    end

    puts 'Startup Ideas:'
    @startupideas.each do |idea|
      puts
      puts "Name: #{idea.name}"
      puts "Description: #{idea.description}"
    end
  end
end
