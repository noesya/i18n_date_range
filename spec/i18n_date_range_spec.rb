# frozen_string_literal: true

RSpec.describe I18nDateRange do
  it "has a version number" do
    expect(I18nDateRange::VERSION).not_to be nil
  end

  it "8 septembre 2023" do
    date_from = Date.new 2023, 9, 8
    string = I18nDateRangeGenerator.generate date_from, nil, :short
    expect(string).to eq("8 septembre 2023")
  end
end
