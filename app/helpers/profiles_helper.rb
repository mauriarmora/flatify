module ProfilesHelper
  def month_range_expenses(n)
    month_index =  Expense::MONTHS.index(Date.today.strftime('%B'))
    if month_index < n
      months_range = []
      months_range << Expense::MONTHS[0 .. month_index]
      months_range << Expense::MONTHS[month_index - n..-1]
      months_range.flatten
    else
      Expense::MONTHS[month_index - n .. month_index]
    end
  end
end
