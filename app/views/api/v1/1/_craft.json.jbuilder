json.craft_path api_v1_craft_path craft
json.extract! craft, :approved, :rejected,
  :is_mobile,
  :coordinates,
  :address,
  :search_tags,
  :essence_tags,
  :theme_tags

json.yelp_craft do
  json.partial! 'api/v1/1/yelp_craft', yelp_craft: craft.yelp_craft
end if craft.yelp_craft

json.twitter_craft do
  json.partial! 'api/v1/1/twitter_craft', twitter_craft: craft.twitter_craft
end if craft.twitter_craft

json.website_craft do
  json.partial! 'api/v1/1/website_craft', website_craft: craft.website_craft
end if craft.website_craft

json.facebook_craft do
  json.partial! 'api/v1/1/facebook_craft', facebook_craft: craft.facebook_craft
end if craft.facebook_craft
