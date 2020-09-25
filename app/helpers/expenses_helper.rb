module ExpensesHelper
  def format_cost(float)
    (float % 1).zero? ? float.to_i : float
  end
end
