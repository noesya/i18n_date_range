# frozen_string_literal: true

# Rails helper
# Format can be :short (default) or :long
# <%= date_range_i18n(start, end, :long)
module I18nDateRangeHelper
  def date_range_i18n(from, to = nil, format = :short)
    I18nDateRangeGenerator.generate(from, to, format)
  end
end
