class HomeworkChecker
  def initialize(path_to_homework)
    @path = path_to_homework
  end
  def index
    # So, I will:
    # 1. crawl /Sites and index 004 directories
    # 2. loop through and run rspec on each
    # 3. collect the results
    # 4. generate a pretty report
    # 5. build a command line interface or cron
    # 6. build options (maybe automailer?)
    Dir.chdir(@path)
    @homework_directories = Dir.glob("*004*").collect { |d| "#{d}" }
  end
  def directories
    @homework_directories || "No directories found. Try running .index to index directories."
  end
  def status
    @homework_directories.collect do |directory|

      # if directory exists, run this command
      if Dir.exists?("#{directory}/spec")
        d = Assignment.new(directory, @path)
        #binding.pry

        #temporary, until I figure out the right way to bundle from code
        unless File.exists?("#{directory}/Gemfile")
          d.run_test!
          if d.passing?
            "Woohoo, #{directory} is done!!"
          else
            "A dog must've eaten it #{directory}..."
          end
        end
      end
    end
  end
end
