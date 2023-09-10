# frozen_string_literal: true

RSpec.describe I18nDateRange do
  it "8 septembre 2023" do
    date_from = Date.new 2023, 9, 8
    string = I18nDateRangeGenerator.generate date_from, nil, :short
    expect(string).to eq("8 septembre 2023")
  end

  it "Vendredi 8 septembre 2023" do
    date_from = Date.new 2023, 9, 8
    string = I18nDateRangeGenerator.generate date_from, nil, :long
    expect(string).to eq("Vendredi 8 septembre 2023")
  end

  it "Du 8 au 9 septembre 2023" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 9
    string = I18nDateRangeGenerator.generate date_from, date_to, :short
    expect(string).to eq("Du 8 au 9 septembre 2023")
  end

  it "Du vendredi 8 au samedi 9 septembre 2023" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 9
    string = I18nDateRangeGenerator.generate date_from, date_to, :long
    expect(string).to eq("Du vendredi 8 au samedi 9 septembre 2023")
  end

  it "Du 8 septembre au 8 octobre 2023" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 10, 8
    string = I18nDateRangeGenerator.generate date_from, date_to, :short
    expect(string).to eq("Du 8 septembre au 8 octobre 2023")
  end

  it "Du vendredi 8 septembre au dimanche 8 octobre 2023" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 10, 8
    string = I18nDateRangeGenerator.generate date_from, date_to, :long
    expect(string).to eq("Du vendredi 8 septembre au dimanche 8 octobre 2023")
  end

  it "Du 8 septembre 2023 au 8 septembre 2024" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2024, 9, 8
    string = I18nDateRangeGenerator.generate date_from, date_to, :short
    expect(string).to eq("Du 8 septembre 2023 au 8 septembre 2024")
  end

  it "Du vendredi 8 septembre 2023 au dimanche 8 septembre 2024" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2024, 9, 8
    string = I18nDateRangeGenerator.generate date_from, date_to, :long
    expect(string).to eq("Du vendredi 8 septembre 2023 au dimanche 8 septembre 2024")
  end
end
