FactoryGirl.define do
  sequence(:id)         { |n| "id-#{n}" }
  sequence(:url)        { |n| "http://someplace-#{n}.com" }
  sequence(:name)       { |n| "name-#{n}" }
  sequence(:username)   { |n| "user-#{n}" }
end