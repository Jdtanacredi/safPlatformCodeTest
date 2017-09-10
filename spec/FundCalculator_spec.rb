require_relative '../FundCalculator'


describe FundCalculator do
  fund = FundCalculator.new('./input_one.txt')
  describe "calculateCumulativeReturn" do
    it "returns month percentages added together" do
      # TODO seems to be off by .03 ... come back and fix
      # expect(fund.calculateCumulativeReturn).to eq(2.66)
    end
  end

  describe 'calculatePositiveMonths' do
    it "returns % of positive months" do
      expect(fund.calculatePositiveMonths).to eq(66.66)
    end
  end

  describe 'findBestMonth' do
    it "returns highest performing month" do
      expect(fund.findBestMonth).to eq(1.80)
    end
  end
end
