# frozen_string_literal: true

# Rails helper
# Format can be :short (default) or :long
# <%= date_range_i18n(start, end, format: :long) %>
# Layout can be :one_line (default) or :two_lines, other might be necessary in the future
module I18nDateRangeHelper

  def date_range_i18n(from_date, to_date = nil, format: :short, layout: :one_line)
    I18nDateRangeGenerator.new(from_date, to_date, format: format, layout: layout).to_s.html_safe
  end

end
