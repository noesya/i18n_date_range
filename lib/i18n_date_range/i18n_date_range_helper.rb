module I18nDateRangeHelper

  def date_range_i18n(from, to = nil, format = :short)
    I18nDateRangeGenerator.generate(from, to, format)
  end
  
end