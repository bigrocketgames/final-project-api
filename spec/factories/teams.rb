FactoryGirl.define do
  factory :team do
    name "Seattle"
    mascot "Seahawks"
    home_location "Seattle, WA"
    sub_sport
  end

  factory :home_team, parent: :team do
    name "Kansas City"
    mascot "Chiefs"
    home_location "Kansas City, MO"
    sub_sport
  end

  factory :away_team, parent: :team do
    name "Los Angeles"
    mascot "Rams"
    home_location "Los Angeles, CA"
    sub_sport
  end

  factory :spare_home_team, parent: :team do
    name "Oakland"
    mascot "Raiders"
    home_location "Oakland, CA"
    sub_sport
  end

  factory :spare_away_team, parent: :team do
    name "Arizona"
    mascot "Cardinals"
    home_location "Glendale, AZ"
    sub_sport
  end

  
end
