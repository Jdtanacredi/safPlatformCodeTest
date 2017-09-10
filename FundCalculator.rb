# require 'bigdecimal'

class FundCalculator
  def initialize(path)
    File.open(path) do |f|
      fundTextLines = f.map do |line|
        line
      end
      @company = fundTextLines[0]
      @year = fundTextLines[1]
      @months = fundTextLines[2].split(',').map { |month| month.to_f  }
    end
  end

  # returns cumulative return
  def calculateCumulativeReturn
    @months.reduce(0, :+)
  end

  # returns % postive months
  def calculatePositiveMonths
    # find all positive months
    positiveMonths = @months.select do |month|
      month > 0
    end

    # hacky fix for now without BigDecimal
    sprintf("%.5s", (positiveMonths.length.to_f / @months.length.to_f) * 100).to_f

    # percentPositive = (positiveMonths.length.to_f / @months.length.to_f) * 100
    # truncatedPercentPositive = BigDecimal::new(percentPositive.to_s).truncate(2).to_f
    # puts truncatedPercentPositive
  end

  # returns best performing month
  def findBestMonth
    @months.max
  end

end

ARGV.each do |path|
  # throwError here if more than 1 argument passed through terminal

  fund = FundCalculator.new(path)

  # TODO move into FundCalculator as a function
  # puts 'Cumulative Return: ' + fund.calculateCumulativeReturn
  # puts '% Positive Months: ' + fund.calculatePositiveMonths
  # puts 'Best Month: ' + fund.findBestMonth
end

# Bloomberg Barclays US Aggregate Bond TR USD
# Year: 2016
# Cumulative Return: 2.66%
# % Positive Months: 66.66%
# Best Month: 1.80%
