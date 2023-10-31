# frozen_string_literal: true

RSpec.describe I18nDateRange do
  it "Pas de date de fin" do
    date_from = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.generate(date_from, nil, format: :short)).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, nil, format: :long)).to eq("Vendredi 8 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, nil, layout: :two_lines)).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, nil, format: :long, layout: :two_lines)).to eq("Vendredi 8 septembre 2023")
  end

  it "Même jour" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :short)).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :long)).to eq("Vendredi 8 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, layout: :two_lines)).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :long, layout: :two_lines)).to eq("Vendredi 8 septembre 2023")
  end
  
  it "Jour différent" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 9
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :short)).to eq("Du 8 au 9 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :long)).to eq("Du vendredi 8 au samedi 9 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, layout: :two_lines)).to eq("8<br>9 septembre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :long, layout: :two_lines)).to eq("Vendredi 8<br>samedi 9 septembre 2023")
  end

  it "Mois différent" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 10, 8
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :short)).to eq("Du 8 septembre au 8 octobre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :long)).to eq("Du vendredi 8 septembre au dimanche 8 octobre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, layout: :two_lines)).to eq("8 septembre<br>8 octobre 2023")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :long, layout: :two_lines)).to eq("Vendredi 8 septembre<br>dimanche 8 octobre 2023")
  end
  
  it "Années différentes" do
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2024, 9, 8
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :short)).to eq("Du 8 septembre 2023 au 8 septembre 2024")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :long)).to eq("Du vendredi 8 septembre 2023 au dimanche 8 septembre 2024")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, layout: :two_lines)).to eq("8 septembre 2023<br>8 septembre 2024")
    expect(I18nDateRangeGenerator.generate(date_from, date_to, format: :long, layout: :two_lines)).to eq("Vendredi 8 septembre 2023<br>dimanche 8 septembre 2024")
  end
end
