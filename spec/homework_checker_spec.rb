# homework checker should traverse /sites directory
# for each directory with 004 in it
# should run spec in directory and see if tests pass
# optionally should see if repo status is clean or dirty
# should report back a list of found homework and status

# i’m thinking a method for status and a method for index (all homework folders, builds array of paths) 
# i’m thinking a CLI
# maybe homework checker accepts an 
# argument of directory to crawl

require_relative './spec_helper'

describe "HomeworkChecker" do
  let(:homework_path) {HomeworkChecker.new('/Users/kiddo/sites/temp/sites')}

  it "can be initialized" do
    expect(homework_path).to be_an_instance_of(HomeworkChecker)
  end

  it "can index a directory" do
    expect(homework_path.index).to be_an(Array)
  end

end