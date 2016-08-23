require "rspec"

require_relative "account"

describe Account do
# general let
#somehow Should syntax is outdated in Rspecs, should use --> expect().to
let(:acct_number)       { "1234567890" }
let(:starting_balance)  { 10 }
let(:acct)              { Account.new(acct_number, starting_balance) }


  describe "#initialize" do
# http://stackoverflow.com/questions/20020194/trying-to-raise-argumenterror-rspec

# validate_number(acct_number)
    context "valid input" do
      it "accepts account number even though without starting_balance" do
         # WRITE YOUR CODE HERE
      end
      it "accepts both account number and starting_balance as argument" do
        # WRITE YOUR CODE HERE
      end
    end

    context "invalid input" do
      it "raise error when no argument is provided" do
        expect { Account.new }.to raise_error(ArgumentError)
      end
      it "raise error when invalid account number (more than 9 digits)" do
        # WRITE YOUR CODE HERE
      end
      it "raise an error when invalid account number (less than 9 digits)" do
         # WRITE YOUR CODE HERE
      end
    end
  end



  describe "#transactions" do
    context "shows transactions" do
      it "returns starting_balance in array" do
         # WRITE YOUR CODE HERE
      end
    end
  end



  describe "#balance" do
    context "returns balance" do
      it "shows current balance" do
         # WRITE YOUR CODE HERE
      end
    end
  end



  describe "#account_number" do
    it "should show partial account number" do
       # WRITE YOUR CODE HERE
    end
    it "should not show full account number" do
       # WRITE YOUR CODE HERE
    end
  end




  describe "deposit!" do
    context "invalid input" do
      it "raise error when no argument is provided for deposit" do
        expect { acct.deposit!() }.to raise_error(ArgumentError)
      end
      it "raise NegativeDepositError when deposit amount is negative" do
         # WRITE YOUR CODE HERE
      end
      it "requires integer argument" do
         # WRITE YOUR CODE HERE
      end
    end

    context "transaction recorded" do
      it "transaction record valid" do
         # WRITE YOUR CODE HERE
      end
    end

    context "correct balance" do
      it "returns correct balance" do
         # WRITE YOUR CODE HERE
      end
      it "increases the balance amount" do
        # WRITE YOUR CODE HERE
      end
    end
  end




  describe "#withdraw!" do
    context "invalid input" do
      it "raise error when no argument is provided for withdrawal" do
        expect { acct.withdraw!() }.to raise_error(ArgumentError)
      end
      it "requires integer argument" do
        expect { acct.withdraw!("abc") }.to raise_error(ArgumentError)
      end
    end

    context "correct balance" do
      it "returns correct balance" do
         # WRITE YOUR CODE HERE
      end
      it "decreases the balance amount" do
        # WRITE YOUR CODE HERE
      end
    end

    context "OverdraftError" do
      it "return OverdraftError when over withdraw" do
       # WRITE YOUR CODE HERE
      end
    end
  end


end