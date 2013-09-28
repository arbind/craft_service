json.craft_path api_v1_craft_path craft
json.extract! craft,
  :mobile,
  :coordinates,
  :address,
  :location_hash,
  :search_tags,
  :essence_tags,
  :theme_tags

json.yelp do
  json.partial! 'api/v1/1/yelp_craft', yelp_craft: craft.yelp
end if craft.yelp

json.twitter do
  json.partial! 'api/v1/1/twitter_craft', twitter_craft: craft.twitter
end if craft.twitter

json.website do
  json.partial! 'api/v1/1/website_craft', website_craft: craft.website
end if craft.website

json.facebook do
  json.partial! 'api/v1/1/facebook_craft', facebook_craft: craft.facebook
end if craft.facebook
