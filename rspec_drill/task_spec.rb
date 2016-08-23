
require "rspec-given"
require "rspec"

require_relative "task"

describe Task do

  let(:description) { "Walk the giraffe" }
  let(:task)        { Task.new(description) }

  describe "#initialize" do
    it "takes a description for its first argument" do
      expect(Task.new("Feed the parakeet")).to be_a_kind_of(Task)
    end

    it "requires one argument" do
       # WRITE YOUR CODE HERE
    end
  end

  describe "#description" do
    it "returns the correct description for the task" do
       # WRITE YOUR CODE HERE
    end
  end

  describe "#complete?" do
    it "returns false for incomplete tasks" do
      # WRITE YOUR CODE HERE
    end

    it "returns true for completed tasks" do
       # WRITE YOUR CODE HERE
    end
  end

  describe "#complete!" do
    # it "changes the task from incomplete to completed" do

      # This is some RSpec goodness which expects a
      # method `complete?` to be defined which returns
      # true or false.
      When {task.complete!}
      Then {task.complete? == true}
    # end
  end
end