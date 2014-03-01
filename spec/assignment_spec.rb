
require_relative './spec_helper'

describe "Assignment" do

  it "can be initialized" do
    a = Assignment.new("apples-and-holidays-ruby-004", "/Users/kiddo/Sites")

    expect(a).to be_an_instance_of(Assignment)
  end

  describe "run basic RSpec tests" do

    let(:assignment) {Assignment.new('apples-and-holidays-ruby-004', '/Users/kiddo/Sites')}


    it "can index a directory" do
      #expect(assignment.run_test!).to be_a(Hash)
    end

  end

end
