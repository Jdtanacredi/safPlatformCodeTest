# require 'bigdecimal'

class FundCalculator
  def initialize(path)
    File.open(path) do |f|
      fundTextLines = f.map do |line|
        line.strip
      end
      @company = fundTextLines[0]
      # Make sure year is length of 4
      @year = fundTextLines[1]
      # Make sure months formatting is proper
      @months = fundTextLines[2].split(',').map { |month| month.to_f  }
    end
  end

  def calculateCumulativeReturn
    sprintf("%.2f", @months.reduce(0, :+))
  end

  def calculatePositiveMonths
    positiveMonths = @months.select do |month|
      month > 0
    end
    #fix for now without BigDecimal
    sprintf("%.5s", (positiveMonths.length.to_f / @months.length.to_f) * 100).to_f
    # percentPositive = (positiveMonths.length.to_f / @months.length.to_f) * 100
    # truncatedPercentPositive = BigDecimal::new(percentPositive.to_s).truncate(2).to_f
    # puts truncatedPercentPositive
  end

  # returns best performing month
  def findBestMonth
    sprintf("%.2f", @months.max)
  end

  def printResults
    puts "#{@company}\nYear: #{@year}\nCumulative Return: #{self.calculateCumulativeReturn}%\n" +
    "% Positive Months: #{self.calculatePositiveMonths}%\nBest Month: #{self.findBestMonth}%"
  end

end
