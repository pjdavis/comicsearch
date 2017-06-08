require 'rails_helper'

RSpec.describe Search, type: :model do

  context "validations" do

    context "requires term" do

      it "is invalid without term" do
        record = Search.new
        record.term = ''
        expect(record.valid?).to be(false)
      end

      it "is valid with a term" do
        record = Search.new
        record.term = 'batman'
        expect(record.valid?).to be(true)
      end
    end
  end
end
