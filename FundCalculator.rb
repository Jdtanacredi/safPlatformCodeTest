class FundCalculator
  def initialize(path)
    # Data needed for each fund
    #Title
    #Year
    #months
  end

  # returns cumulative return
  def calculateCumulativeReturn
    puts 'testing class method call'
  end

  # returns % postive months
  def calculatePositiveMonths

  end

  # returns best performing month
  def findBestMonth

  end

end

ARGV.each do |path|
  # throwError here if more than 1 argument passed through terminal

  fund = FundCalculator.new(path)
  fund.calculateCumulativeReturn
end

# Bloomberg Barclays US Aggregate Bond TR USD
# Year: 2016
# Cumulative Return: 2.66%
# % Positive Months: 66.66%
# Best Month: 1.80%
