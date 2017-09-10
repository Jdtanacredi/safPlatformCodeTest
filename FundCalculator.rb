# require 'bigdecimal'

class FundCalculator
  def initialize(path)
    File.open(path) do |f|
      fundTextLines = f.map do |line|
        line.strip
      end

      @company = fundTextLines[0]
      @year = fundTextLines[1]
      @months = fundTextLines[2].split(',').map { |month| month.to_f  }
      if @year.length != 4
        raise RuntimeError.new('invalid year provided')
      end
      if @months.length != 12
        raise RuntimeError.new('must have 12 months of data')
      end
    end
  end

  def calculateCumulativeReturn
    sprintf("%.2f", @months.reduce(0, :+))
  end

  def calculatePositiveMonths
    positiveMonths = @months.select do |month|
      month > 0
    end
    sprintf("%.5s", (positiveMonths.length.to_f / @months.length.to_f) * 100).to_f
    # BigDecimal option below:
    # percentPositive = (positiveMonths.length.to_f / @months.length.to_f) * 100
    # BigDecimal::new(percentPositive.to_s).truncate(2).to_f
  end

  def findBestMonth
    sprintf("%.2f", @months.max)
  end

  def printResults
    puts "#{@company}\nYear: #{@year}\nCumulative Return: #{self.calculateCumulativeReturn}%\n" +
    "% Positive Months: #{self.calculatePositiveMonths}%\nBest Month: #{self.findBestMonth}%"
  end

end
