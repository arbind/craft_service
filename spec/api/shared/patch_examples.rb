module PatchExamples
  shared_examples_for 'it updates an existing craft' do
    include_context "json response"
    include_context 'modified craft attributes'
    let!(:item)         { create :craft, craft_attributes }
    let!(:before_count) { Craft.count }
    let (:payload)      {{ craft: q_craft_attributes.merge({'craft_path'=> api_v1_craft_path(item)}) }}
    it_behaves_like "an item endpoint", :patch, :craft
    before do
      expect(item.search_tags).to eq craft_base['search_tags']
      expect(item.twitter.description).to eq twitter_craft_base['description']
    end
    before  { patch endpoint, payload, nil }
    specify { Craft.count.should eq before_count }
    it 'updates geo-coordinates' do
      lng, lat = json_data['coordinates']
      expect(lng).to be_within(2).of 74
      expect(lat).to be_within(2).of 15
    end
    it 'updates other attributes' do
      expect(json_data['search_tags']).to eq q_craft_base['search_tags']
      expect(json_data['yelp']['description']).to eq q_yelp_craft_base['description']
      expect(json_data['twitter']['description']).to eq q_twitter_craft_base['description']
      expect(json_data['website']['description']).to eq q_website_craft_base['description']
      expect(json_data['facebook']['description']).to eq q_facebook_craft_base['description']
    end
    it 'updates the item' do
      item.reload
      expect(item.search_tags).to eq q_craft_base['search_tags']
      expect(item.yelp.description).to eq q_yelp_craft_base['description']
      expect(item.twitter.description).to eq q_twitter_craft_base['description']
      expect(item.website.description).to eq q_website_craft_base['description']
      expect(item.facebook.description).to eq q_facebook_craft_base['description']
    end
  end
end