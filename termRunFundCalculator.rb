require_relative 'FundCalculator'

ARGV.each do |path|
  if ARGV.length > 1
    raise RuntimeError.new('Only 1 argument allowed!')
  end

  fund = FundCalculator.new(path)
  fund.printResults
end
