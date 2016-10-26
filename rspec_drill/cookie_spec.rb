
require 'rspec'

require_relative 'cookie'

describe Cookie do

  let(:type)   { "peanut butter" }
  #abc = "peanut butter"

  let(:cookie) { Cookie.new(type) }
  #cookie = Cookie.new()

  describe "#initialize" do
    context "with valid input" do #happy path
      it "creates a new Cookie of the specified type" do
        # http://www.relishapp.com/rspec/rspec-expectations/v/3-5/docs/built-in-matchers


      end
    end

    context "with invalid input" do #unhappy path
      it "throws an argument error when not given a type argument" do
         # http://www.relishapp.com/rspec/rspec-expectations/v/3-5/docs/built-in-matchers/raise-error-matcher

 

      end
    end
  end

  describe "#type" do
    it "returns the type of the cookie" do

    end
  end

  describe "#bake!" do
    # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/type-check-matchers
    it "requires an integer time argument" do

    end


  # #   it "returns the cookie object"


  #   it "changes the status of the cookie when given enough time" do
  #     # https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers

  #   end
  end

  # describe "#status" do
  #   it "returns the cookie's current status"


  #   context "when unbaked" do
  #     it "is `:doughy`"

  #   end

  #   context "when baked for less than 7 minutes" do
  #     it "is `:doughy`"

  #   end

  #   context "when baked for at least 7 but less than 10 minutes" do
  #     it "is `:almost_ready`"

  #   end

  #   context "when baked for at least 10 but less than 12 minutes" do
  #     it "is `:ready`"

  #   end

  #   context "when baked for at least 12 minutes" do
  #     it "is `:burned`"

  #   end
  # end
end
