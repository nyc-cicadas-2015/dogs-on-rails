require 'rails_helper'

describe User do
  context "Can fizzbuzz" do
    let(:user) { create(:user) }

    it "says fizzbuzz" do
      expect(user.fizzbuzz(90)).to eq 'fizzbuzz'
    end

    it "says fizz" do
      expect(user.fizzbuzz(3)).to eq 'fizz'
    end

    it "says buzz" do
      expect(user.fizzbuzz(10)).to eq 'buzz'
    end

    it "says cicada" do
      expect(user.fizzbuzz(7)).to eq 'Cicada!'
    end
  end
end
