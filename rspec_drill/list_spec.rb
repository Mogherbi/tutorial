require "rspec"

require_relative "list"
require_relative "task"

describe List do

	let(:title) { "Walk the giraffe" }
	let(:task1){ Task.new("firsttask") }
  let(:task2){ Task.new("secondtask") }
  let(:lista) { List.new(title, [task1, task2]) }

	describe "#initialize" do

    context "input has to be valid" do
      it "takes a description for its first argument" do
         # WRITE YOUR CODE HERE
      end

      it "requires one argument" do
        expect { List.new }.to raise_error(ArgumentError)
      end

      it "accepts only string as title" do
         # WRITE YOUR CODE HERE
      end


      it "creates valid todolist" do
        expect(List.new(title,[Task.new("a")])).to be_an_instance_of(List)
      end

      it "raise error when invalid todolist" do
        # WRITE YOUR CODE HERE
      end

    end

  end

  describe "#add_task" do
    it "adds in task into array" do
      # WRITE YOUR CODE HERE
    end

    it "requires one argument" do
       # WRITE YOUR CODE HERE
    end
  end

  describe "#complete_task" do
    it "completes a task successfully" do
       # WRITE YOUR CODE HERE
    end
    it "requires one argument" do
       # WRITE YOUR CODE HERE
    end
  end

  describe "#delete_task" do
    it "deletes a task successfully" do
     # WRITE YOUR CODE HERE
    end
    it "requires one argument" do
      expect { lista.delete_task }.to raise_error(ArgumentError)
    end
  end

  describe "#completed_task" do
    it "shows completed tasks" do
      # WRITE YOUR CODE HERE
    end

    it "does not show uncompleted tasks" do
       # WRITE YOUR CODE HERE
    end

  end




end