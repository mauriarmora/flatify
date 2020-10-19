module ApplicationHelper
  def month_to_spanish
    Expense::MONTHS[Date.today.strftime('%m').to_i - 1]
  end
end
