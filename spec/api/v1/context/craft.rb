shared_context 'valid craft attributes' do
  let (:yelp_craft_base)     {{
    'web_craft_id'=>'yelp-1',
    'username'=>'yelp-user-1',
    'href'=>'http://yelp.com/yelp-1',
    'name'=>'yelp-name-1',
    'description'=>'yelp-desc-1'
  }}
  let (:twitter_craft_base)  {{
    'web_craft_id'=>'twitter-1',
    'username'=>'twitter-user-1',
    'href'=>'http://twitter.com/twitter-1',
    'name'=>'twitter-name-1',
    'description'=>'twitter-desc-1'
  }}
  let (:website_craft_base)  {{
    'web_craft_id'=>'website-1',
    'username'=>'website-user-1',
    'href'=>'http://website.com/website-1',
    'name'=>'website-name-1',
    'description'=>'website-desc-1'
  }}
  let (:facebook_craft_base) {{
    'web_craft_id'=>'facebook-1',
    'username'=>'facebook-user-1',
    'href'=>'http://facebook.com/facebook-1',
    'name'=>'facebook-name-1',
    'description'=>'facebook-desc-1'
  }}
  let (:craft_base)          {{
      "address"       => "3rd St. Promenade, Santa Monica, CA",
      "mobile"     => true,
      "search_tags"   => ['a', 'b'],
      "essence_tags"  => ['e', 'f'],
      "theme_tags"    => ['t', 'u']
  }}

  let (:craft_attributes) {
    atts = {}.merge craft_base
    atts["yelp"] =     yelp_craft_base
    atts["twitter"] =  twitter_craft_base
    atts["website"] =  website_craft_base
    atts["facebook"] = facebook_craft_base
    atts
  }
end

shared_context 'modified craft attributes' do
  let (:q_yelp_craft_base)     {{
    'description'=>'yelp-desc-updated'
  }}
  let (:q_twitter_craft_base)  {{
    'description'=>'twitter-desc-updated'
  }}
  let (:q_website_craft_base)  {{
    'description'=>'website-desc-updated'
  }}
  let (:q_facebook_craft_base) {{
    'description'=>'facebook-desc-updated'
  }}
  let (:q_craft_base)          {{
      "address"       => "Goa, India",
      "search_tags"   => ['a', 'b', 'updated search'],
      "essence_tags"  => ['e', 'f', 'updated essence'],
      "theme_tags"    => ['t', 'u', 'updated theme']
  }}

  let (:q_craft_attributes) {
    atts = {}.merge q_craft_base
    atts["yelp"] =     q_yelp_craft_base
    atts["twitter"] =  q_twitter_craft_base
    atts["website"] =  q_website_craft_base
    atts["facebook"] = q_facebook_craft_base
    atts
  }
end
