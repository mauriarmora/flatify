module ExpensesHelper
  def format_cost(float)
    (float % 1).zero? ? float.to_i : float.round(2)
  end

  def month_range_expenses(n)
    month_index =  Expense::MONTHS.index(Date.today.strftime('%B'))
    if month_index < n
      months_range = []
      months_range << Expense::MONTHS[0 .. month_index]
      months_range << Expense::MONTHS[month_index-n..-1]
      return months_range.flatten
    else
      return Expense::MONTHS[month_index - n .. month_index]
    end
    # months_range.negative? ? -1 * months_range : months_range
  end
end
