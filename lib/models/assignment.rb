class Assignment

  def initialize(path)
    @path = path
  end
  
  def completed?
    @status
  end

  def failing?
    !@status
  end

  def run_test!
    result = RSpec::Core::Runner.run([@path])
    @status = result == 0 ? true : false
  end    
end


# a = Assignment.new("/Users/kiddo/Sites/sequel-orms-ruby-004")

# a.completed?