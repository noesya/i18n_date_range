# frozen_string_literal: true

# Computing range to choose the correct form
class I18nDateRangeGenerator
  attr_reader :from_date, :to_date, :format, :layout, :locale

  KIND_NO_END = :no_end
  KIND_SAME_DAY = :same_day
  KIND_SAME_MONTH = :same_month
  KIND_SAME_YEAR = :same_year
  KIND_OTHER = :other

  # "format" can be :short or :long. "layout" can be :one_line or :two_lines
  def initialize(from_date, to_date = nil, format: :short, layout: :one_line, locale: I18n.locale)
    @from_date = from_date
    @to_date = to_date
    @format = format
    @layout = layout
    @locale = locale
  end

  def to_s
    layout == :two_lines && to_formatted.present? ? from_formatted + '<br>' + to_formatted : from_formatted + to_formatted
  end

  protected

  # Analyzing

  def kind
    unless @kind
      @kind = KIND_OTHER
      @kind = KIND_SAME_YEAR if same_year?
      @kind = KIND_SAME_MONTH if same_month?
      @kind = KIND_SAME_DAY if same_day?
      @kind = KIND_NO_END if no_end?
    end
    @kind
  end

  def same_year?
    from_date.year == to_date&.year
  end

  def same_month?
    from_date.year == to_date&.year && from_date.month == to_date&.month
  end

  def same_day?
    to_date == from_date
  end

  def no_end?
    to_date.blank?
  end

  def from_sentence
    I18n.t("#{composite_key}.from.sentence", locale: locale)
  end

  def from_upcase_first
    I18n.t("#{composite_key}.from.upcase_first", locale: locale)
  end

  def to_sentence
    I18n.t("#{composite_key}.to.sentence", locale: locale)
  end

  def to_upcase_first
    I18n.t("#{composite_key}.to.upcase_first", locale: locale)
  end

  def from_formatted
    @from_formatted ||= begin
      from = I18n.l(from_date, format: from_sentence, locale: locale)
      from = from.upcase_first if from_upcase_first
      from
    end
  end

  def to_formatted
    return '' if no_end?
    @to_formatted ||= begin
      to = I18n.l(to_date, format: to_sentence, locale: locale)
      to = to.upcase_first if to_upcase_first
      to
    end
  end

  def composite_key
    "date_range.#{kind}.#{layout}.#{format}"
  end

end