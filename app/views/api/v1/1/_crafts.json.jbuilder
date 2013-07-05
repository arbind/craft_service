json.array! list do |craft|
  json.partial! 'api/v1/1/craft', craft: craft
end