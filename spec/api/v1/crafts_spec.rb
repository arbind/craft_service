require "spec_helper"
require "api/v1/context/craft"

describe "/materialize", type: :request do
  context 'When the craft does not exist' do
    it 'creates a new craft'
  end
  context 'When the craft already exists' do
    context 'given a craft_path' do
      it 'updates the craft via craft_path'
    end
    context 'given no craft_path' do
      it 'updates the craft via twitter and yelp ids'
    end
  end
end

describe "/crafts", type: :request do
  include_context 'json response'
  include_context 'valid craft attributes'
  let!(:crafts)     { create_list :craft, 3 }
  let (:endpoint)   { api_v1_crafts_path }

  context :GET do
    let (:list)     { crafts }
    it_behaves_like "an array endpoint", :get, :craft
  end

  context :POST do
    let (:item)         { nil }
    let (:payload)      {{ craft: craft_attributes }}
    let!(:before_count)  { Craft.count }
    it_behaves_like "an item endpoint", :post, :craft
    before  { post endpoint, payload, nil }
    specify { Craft.count.should eq before_count + 1 }
    it 'has geo-coordinates' do
      lng, lat = json_data['coordinates']
      expect(lng).to be_within(2).of -118
      expect(lat).to be_within(2).of 34
    end
    it 'has the right attributes' do
      expect(json_data['search_tags']).to eq craft_base['search_tags']
      expect(json_data['yelp_craft']['description']).to eq yelp_craft_base['description']
      expect(json_data['twitter_craft']['description']).to eq twitter_craft_base['description']
      expect(json_data['website_craft']['description']).to eq website_craft_base['description']
      expect(json_data['facebook_craft']['description']).to eq facebook_craft_base['description']
    end
  end

  it 'does not allow duplicate web craft id'
  # it 'does not allow duplicate web craft id' do
  #   expect(json_error).to eq 1
  # end

  describe "/:id" do
    let!(:item)   { create :craft, craft_attributes }
    let (:endpoint) { api_v1_craft_path(item) }

    context :GET do
      it_behaves_like "an item endpoint", :get, :craft
      before  { get endpoint, nil, nil }
      it 'has the right attributes' do
        puts json_data
        expect(json_data['search_tags']).to eq craft_base['search_tags']
        expect(json_data['yelp_craft']['description']).to eq yelp_craft_base['description']
        expect(json_data['twitter_craft']['description']).to eq twitter_craft_base['description']
        expect(json_data['website_craft']['description']).to eq website_craft_base['description']
        expect(json_data['facebook_craft']['description']).to eq facebook_craft_base['description']
      end
    end

    context :PATCH do
      include_context 'modified craft attributes'
      let (:payload)      {{ craft: q_craft_attributes }}
      let!(:before_count)  { Craft.count }
      it_behaves_like "an item endpoint", :patch, :craft
      before do
        expect(item.search_tags).to eq craft_base['search_tags']
        expect(item.twitter_craft.description).to eq twitter_craft_base['description']
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
        expect(json_data['yelp_craft']['description']).to eq q_yelp_craft_base['description']
        expect(json_data['twitter_craft']['description']).to eq q_twitter_craft_base['description']
        expect(json_data['website_craft']['description']).to eq q_website_craft_base['description']
        expect(json_data['facebook_craft']['description']).to eq q_facebook_craft_base['description']
      end
      it 'updates the item' do
        item.reload
        expect(item.search_tags).to eq q_craft_base['search_tags']
        expect(item.yelp_craft.description).to eq q_yelp_craft_base['description']
        expect(item.twitter_craft.description).to eq q_twitter_craft_base['description']
        expect(item.website_craft.description).to eq q_website_craft_base['description']
        expect(item.facebook_craft.description).to eq q_facebook_craft_base['description']
      end
    end

    context :DELETE do
      let!(:before_count)  { Craft.count }
      before  do
        expect(Craft.find item.id).to eq item
      end
      before  { delete endpoint, nil, nil }
      specify { Craft.count.should eq before_count - 1 }
      it 'deletes the item' do
        expect{Craft.find item.id }.to raise_error Mongoid::Errors::DocumentNotFound
      end
    end
  end
end