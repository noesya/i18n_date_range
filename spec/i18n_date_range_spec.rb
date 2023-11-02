# frozen_string_literal: true

RSpec.describe I18nDateRange do
  it "no end" do
    date_from = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.new(date_from).to_s).to eq("À partir du 8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :short).to_s).to eq("À partir du 8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :long).to_s).to eq("À partir du vendredi 8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, layout: :two_lines).to_s).to eq("À partir du <br>8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :long, layout: :two_lines).to_s).to eq("À partir du <br>vendredi 8 septembre 2023")
  end

  it "same day" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Vendredi 8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre 2023")
  end
  
  it "same month" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 9
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("Du 8 au 9 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Du vendredi 8 au samedi 9 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 septembre<br>9 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre<br>Samedi 9 septembre 2023")
  end

  it "same year" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 10, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("Du 8 septembre au 8 octobre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Du vendredi 8 septembre au dimanche 8 octobre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 septembre<br>8 octobre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre<br>Dimanche 8 octobre 2023")
  end
  
  it "other" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2024, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("Du 8 septembre 2023 au 8 septembre 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Du vendredi 8 septembre 2023 au dimanche 8 septembre 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 septembre 2023<br>8 septembre 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre 2023<br>Dimanche 8 septembre 2024")
  end
end
