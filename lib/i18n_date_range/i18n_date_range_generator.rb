class I18nDateRangeGenerator
  attr_reader :from_date, :to_date, :format
  
  def self.generate(from_date, to_date, format)
    new(from_date, to_date, format).to_s
  end

  def initialize(from_date, to_date, format)
    @from_date = from_date
    @to_date = to_date
    @format = format
  end
  
  def to_s
    to_date.blank? || to_date == from_date ? without_to : with_to
  end

  protected

  def without_to
    I18n.t(
      'date_range.without_to', 
      from: format_date(from_date, :day_month_year)
    ).capitalize
  end

  def with_to
    I18n.t(
      'date_range.with_to', 
      from: format_date(from_date, from_format), 
      to: format_date(to_date, :day_month_year)
    .capitalize
  end

  def from_format
    return :day_month_year if different_year?
    return :day_month if different_month?
    :day
  end

  def format_date(date, key)
    I18n.l(
      date, 
      format: "#{format}.#{key}".to_sym
    )
  end

  def different_year?
    from_date.year != to_date.year
  end

  def different_month?
    from_date.month != to_date.month
  end

end