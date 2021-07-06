# frozen_string_literal: true

class OodWorker
  def self.call(cost, budget)
    oods = []
    budget.sort.map do |value|
      oods.push(Ood.new(value.to_i))
    end
    return false if budget.sum < cost

    while cost != 0
      oods.map do |ood|
      next if ood.budget.zero?
      break if cost.zero?

      ood.fire
      cost -= 1
      end
    end
    oods.map(&:participation).sort
  end
    end

class Ood
  attr_reader :budget, :participation, :ruined

  def initialize(budget)
    @budget = budget
    @participation = 0
    @ruined = budget.zero?
  end

  def fire
    @budget -= 1
    @participation += 1

    self
  end
end

print OodWorker.call(100, [50, 40, 1, 70, 1])