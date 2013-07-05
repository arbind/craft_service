require "spec_helper"

describe "/crafts", type: :request do
  let!(:crafts)     { create_list :craft, 3 }
  let (:endpoint)   { api_v1_crafts_path }

  context :GET do
    let (:list)     { crafts }
    it_behaves_like "an array endpoint", :get, :craft
  end

  describe "/:id" do
    let (:endpoint) { api_v1_craft_path(item) }

    context :GET do
      let (:item)   { Craft.all.second }
      it_behaves_like "an item endpoint", :get, :craft
    end
  end
end