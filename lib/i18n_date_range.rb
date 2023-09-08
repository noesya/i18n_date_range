# frozen_string_literal: true

require_relative "i18n_date_range/version"
require_relative "i18n_date_range/i18n_date_range_generator"
require_relative "i18n_date_range/i18n_date_range_helper"

module I18nDateRange
  class Error < StandardError; end

  class Engine < ::Rails::Engine
    isolate_namespace I18nDateRange

    ActiveSupport.on_load( :action_view ){ include I18nDateRangeHelper }
  end
end
