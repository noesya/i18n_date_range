# frozen_string_literal: true

# Rails helper
# Format can be :short (default) or :long
# <%= date_range_i18n(start, end, :long)
# Layout can be :one_line (default) or :two_lines, other might be necessary in the future
module I18nDateRangeHelper

  def date_range_i18n(from, to = nil, format: nil, layout: nil)
    I18nDateRangeGenerator.generate(from, to, format: format, layout: layout)
  end

end
