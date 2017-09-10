require_relative '../FundCalculator'


describe FundCalculator do
  describe "calculateCumulativeReturn" do
    it "returns month percentages added together" do
      fund = FundCalculator.new('./input_one.txt')
      expect(fund.calculateCumulativeReturn).to eq(2.66)
    end
  end
end
