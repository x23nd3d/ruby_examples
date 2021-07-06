class OodWorker
  attr_reader :cost, :budgets

  def initialize(cost, budgets)
    @cost = cost
    @budgets = budgets
  end

  def call
    print calculate(cost, budgets.sort)
  end

  private

  def calculate(price, budget)
    pays = []
    budget.each { pays.push(0) }

    while price != 0
      sum = budget.inject { |n, sum| n + sum }
      return false if sum < price

      budget.each_with_index.map do |e, i|
        return false if budget[i].class == Float
        next if budget[i].zero?
        break if price.zero?

        pays[i] += 1
        budget[i] -= 1
        price -= 1
      end
    end
    pays.sort
  end
end

OodWorker.new(100, [40, 40, 40]).call