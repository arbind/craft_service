require "spec_helper"
require "api/v1/context/craft"

describe "/materialize", type: :request do
  include_context 'json response'
  include_context 'valid craft attributes'
  let (:endpoint)   { api_v1_materialize_path }

  context 'When the craft does not exist' do
    let (:item)         { nil }
    let (:payload)      {{ craft: craft_attributes }}
    let!(:before_count) { Craft.count }
    it_behaves_like "an item endpoint", :post, :craft
    before  { post endpoint, payload, nil }
    specify { Craft.count.should eq before_count + 1 }
  end
  context 'When the craft already exists' do
    it_behaves_like 'it updates an existing craft'
  end
end

describe "/crafts", type: :request do
  include_context 'json response'
  include_context 'valid craft attributes'
  let!(:crafts)   { create_list :craft, 3 }
  let (:endpoint) { api_v1_crafts_path }

  context :GET do
    let (:list)     { crafts }
    it_behaves_like "an array endpoint", :get, :craft
  end

  context :POST do
    let (:item)         { nil }
    let (:payload)      {{ craft: craft_attributes }}
    let!(:before_count) { Craft.count }
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
      expect(json_data['yelp']['description']).to eq yelp_craft_base['description']
      expect(json_data['twitter']['description']).to eq twitter_craft_base['description']
      expect(json_data['website']['description']).to eq website_craft_base['description']
      expect(json_data['facebook']['description']).to eq facebook_craft_base['description']
    end
  end

  describe "/:id" do
    let!(:item)     { create :craft, craft_attributes }
    let (:endpoint) { api_v1_craft_path(item) }

    context :GET do
      it_behaves_like "an item endpoint", :get, :craft
      before  { get endpoint, nil, nil }
      it 'has the right attributes' do
        expect(json_data['search_tags']).to eq craft_base['search_tags']
        expect(json_data['yelp']['description']).to eq yelp_craft_base['description']
        expect(json_data['twitter']['description']).to eq twitter_craft_base['description']
        expect(json_data['website']['description']).to eq website_craft_base['description']
        expect(json_data['facebook']['description']).to eq facebook_craft_base['description']
      end
    end

    context :PATCH do
      it_behaves_like 'it updates an existing craft'
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