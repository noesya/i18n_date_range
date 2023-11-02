# frozen_string_literal: true

RSpec.describe I18nDateRange do
  it "fr - no end" do
    I18n.locale = 'fr'
    date_from = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, format: :short).to_s).to eq("À partir du 8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :long).to_s).to eq("À partir du vendredi 8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, layout: :two_lines).to_s).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre 2023")
  end

  it "fr - same day" do
    I18n.locale = 'fr'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Vendredi 8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre 2023")
  end
  
  it "fr - same month" do
    I18n.locale = 'fr'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 18
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("Du 8 au 18 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Du vendredi 8 au lundi 18 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 septembre<br>18 septembre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre<br>Lundi 18 septembre 2023")
  end

  it "fr - same year" do
    I18n.locale = 'fr'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 10, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("Du 8 septembre au 8 octobre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Du vendredi 8 septembre au dimanche 8 octobre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 septembre<br>8 octobre 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre<br>Dimanche 8 octobre 2023")
  end
  
  it "fr - other" do
    I18n.locale = 'fr'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2024, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("Du 8 septembre 2023 au 8 septembre 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Du vendredi 8 septembre 2023 au dimanche 8 septembre 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 septembre 2023<br>8 septembre 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Vendredi 8 septembre 2023<br>Dimanche 8 septembre 2024")
  end

  it "en - no end" do
    I18n.locale = 'en'
    date_from = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, format: :short).to_s).to eq("From September 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :long).to_s).to eq("From Friday September 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, layout: :two_lines).to_s).to eq("September 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :long, layout: :two_lines).to_s).to eq("Friday September 8, 2023")
  end

  it "en - same day" do
    I18n.locale = 'en'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("September 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Friday September 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("September 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Friday September 8, 2023")
  end
  
  it "en - same month" do
    I18n.locale = 'en'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 18
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("From September 8 to 18, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("From Friday September 8 to Monday September 18, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("September 8<br>September 18, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Friday September 8<br>Monday September 18, 2023")
  end

  it "en - same year" do
    I18n.locale = 'en'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 10, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("From September 8 to October 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("From Friday September 8 to Sunday October 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("September 8<br>October 8, 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Friday September 8<br>Sunday October 8, 2023")
  end
  
  it "en - other" do
    I18n.locale = 'en'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2024, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("From September 8, 2023 to September 8, 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("From Friday September 8, 2023 to Sunday September 8, 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("September 8, 2023<br>September 8, 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Friday September 8, 2023<br>Sunday September 8, 2024")
  end

  it "en-GB - no end" do
    I18n.locale = 'en-GB'
    date_from = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, format: :short).to_s).to eq("From 8 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :long).to_s).to eq("From Friday 8 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, layout: :two_lines).to_s).to eq("8 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, format: :long, layout: :two_lines).to_s).to eq("Friday 8 September 2023")
  end

  it "en-GB - same day" do
    I18n.locale = 'en-GB'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("8 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("Friday 8 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Friday 8 September 2023")
  end
  
  it "en-GB - same month" do
    I18n.locale = 'en-GB'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 9, 18
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("From 8 to 18 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("From Friday 8 to Monday 18 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 September<br>18 September 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Friday 8 September<br>Monday 18 September 2023")
  end

  it "en-GB - same year" do
    I18n.locale = 'en-GB'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2023, 10, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("From 8 September to 8 October 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("From Friday 8 September to Sunday 8 October 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 September<br>8 October 2023")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Friday 8 September<br>Sunday 8 October 2023")
  end
  
  it "en-GB - other" do
    I18n.locale = 'en-GB'
    date_from = Date.new 2023, 9, 8
    date_to = Date.new 2024, 9, 8
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :short).to_s).to eq("From 8 September 2023 to 8 September 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long).to_s).to eq("From Friday 8 September 2023 to Sunday 8 September 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, layout: :two_lines).to_s).to eq("8 September 2023<br>8 September 2024")
    expect(I18nDateRangeGenerator.new(date_from, date_to, format: :long, layout: :two_lines).to_s).to eq("Friday 8 September 2023<br>Sunday 8 September 2024")
  end


end
