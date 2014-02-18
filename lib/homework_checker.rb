require 'pry'

class HomeworkChecker
  def initialize(path_to_homework)
    #binding.pry
    @path = path_to_homework
  end
  def index
    array_of_directories = Dir.new(@path).entries
  end
end