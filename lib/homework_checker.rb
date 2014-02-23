class HomeworkChecker 
  def initialize(path_to_homework)
    @path = path_to_homework
  end
  def index
    # RSpec::Core::Runner.run(['homework-checker/spec'], $stderr, $stdout)
    # So, I will:
    # 1. crawl /Sites and index 004 directories
    # 2. loop through and run rspec on each
    # 3. collect the results
    # 4. generate a pretty report
    # 5. build a command line interface or cron
    # 6. build options (maybe automailer?)
    Dir.chdir(@path)
    @homework_directories = Dir.glob("*004*").collect { |d| "#{d}/spec" }
  end
  def directories
    @homework_directories || "No directories found. Try running .index to index directories."
  end
  def status
    @homework_directories.each do |directory|
      # if directory exists, run this command
      #binding.pry
      puts directory
      if Dir.exists?(directory)
        RSpec::Core::Runner.run([directory], "hw-status/#{directory}/errors.html", "hw-status/#{directory}/output.html")
      end
    end
  end
end