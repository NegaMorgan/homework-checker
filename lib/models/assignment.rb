class Assignment

  def initialize(path, basepath)
    @basepath = basepath
    @path = "#{basepath}/#{path}"
  end

  def passing?
    failure_count == 0
  end

  def partially_passing?
    !passing? && results[:summary][:example_count] > failure_count
  end

  def pending?
    results[:summary][:pending_count] > 0
  end

  def failing?
    failure_count > 0
  end

  def failure_count
    results[:summary][:failure_count]
  end

  def results
    @results_hash# || "No results found. Try .run_test! and then re-run this method."
  end

  def run_test!
    # figure out how to cd into directory each time
    Dir.chdir(@path)
    system("bundle") if File.exists?("Gemfile")

    RSpec.configure { |c| c.add_formatter(:json) }
    config = RSpec.configuration

    # Create a JSON formatter with STDOUT steam
    json_formatter = RSpec::Core::Formatters::JsonFormatter.new($stdout)
    # the reporter can be used later for RSpec configuration
    json_reporter  = RSpec::Core::Reporter.new(json_formatter)
    reporter =  RSpec::Core::Reporter.new(json_formatter)
    # set reporter for rspec configuration
    config.instance_variable_set(:@reporter, reporter)

    # execute rspec runner
    RSpec::Core::Runner.run([@path])

    # output test result as json
    @results_hash = json_formatter.output_hash

    Dir.chdir(@basepath)
  end

end
