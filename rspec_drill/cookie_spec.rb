require 'rspec'

require_relative 'cookie'

describe Cookie do
# general
  let(:type)   { "peanut butter" }
  let(:cookie) { Cookie.new(type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Cookie correctly according to what i had specified on the type the specified type" do
        # https://www.relishapp.com/rspec/rspec-expectations/v/2-13/docs/built-in-matchers/equality-matchers
        # WRITE YOUR CODE HERE

      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/expect-error
         # WRITE YOUR CODE HERE
      end
    end
  end

  describe "#type" do
    it "returns the type of the cookie" do
       # WRITE YOUR CODE HERE
    end
  end

  describe "#bake!" do
    it "requires an integer time argument" do
      # https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/type-check-matchers

      # WRITE YOUR CODE HERE
    end

    it "returns the cookie object" do
      # https://www.relishapp.com/rspec/rspec-expectations/v/3-3/docs/built-in-matchers/equality-matchers
       # WRITE YOUR CODE HERE
    end

    it "changes the status of the cookie when given enough time" do
       # WRITE YOUR CODE HERE
    end
  end

  describe "#status" do
    it "returns the cookie's current status" do
       # WRITE YOUR CODE HERE
    end

    context "when unbaked" do
      it "is `:doughy`" do
       expect {cookie.bake!(7)}.to change(cookie, :status)
      end
    end

    context "when baked for less than 7 minutes" do
      it "is `:doughy`" do
        # cookie.bake!(6)
        expect(cookie.bake!(6).status).to eq(:doughy)
      end
    end

    context "when baked for at least 7 but less than 10 minutes" do
      it "is `:almost_ready`" do
         # WRITE YOUR CODE HERE
      end
    end

    context "when baked for at least 10 but less than 12 minutes" do
      it "is `:ready`" do
         # WRITE YOUR CODE HERE
      end
    end

    context "when baked for at least 12 minutes" do
      it "is `:burned`" do
         # WRITE YOUR CODE HERE
      end
    end

  end
end




#     end
#   end
# end