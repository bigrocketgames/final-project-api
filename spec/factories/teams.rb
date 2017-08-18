FactoryGirl.define do
  factory :team do
    name "Seattle"
    mascot "Seahawks"
    home_location "Seattle, WA"
    sub_sport
  end

  factory :home_team, parent: :team do
    name "Denver"
    mascot "Broncos"
    home_location "Denver, CO"
    sub_sport
  end

  factory :away_team, parent: :team do
    name "Los Angeles"
    mascot "Rams"
    home_location "Los Angeles, CA"
    sub_sport
  end
end
