FactoryGirl.define do

  factory :web_craft do
    web_craft_id  { FactoryGirl.generate :id }
    href          { FactoryGirl.generate :url }
    name          { FactoryGirl.generate :name }

    factory :website_craft do
    end

    factory :yelp_craft do
    end

    factory :facebook_craft do
    end

    factory :twitter_craft do
    end

  end

end
