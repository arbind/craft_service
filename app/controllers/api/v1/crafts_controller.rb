class Api::V1::CraftsController < Api::V1::ApiController
  before_action :set_craft,  only: [:show, :update, :destroy]
  before_action :set_crafts, only: [:index]

  # GET /crafts
  def index
  end

  # GET /craft/1
  def show
  end

  # POST /api/v1/crafts/:id
  def create
    @craft = Craft.create! new_craft_params
    render template: '/api/v1/crafts/show', status: 201
  end

  # PATCH /api/v1/crafts/:id
  def update
    @craft.update_attributes! updated_craft_params
    render template: '/api/v1/crafts/show', status: 200
  end

  # DELETE /api/v1/crafts/:id
  def destroy
    @craft.destroy
    render template: '/api/v1/crafts/show', status: 202
  end

  private

  def set_crafts
    @crafts = Craft.all
  end

  def set_craft
    @craft = Craft.find(params[:id])
  end

  def updated_craft_params
    new_craft_params
  end

  def new_craft_params
    params.require(:craft).permit(new_craft_param_list)
  end

  def new_craft_param_list
    [
      :address,
      :is_mobile,
      :approved,
      search_tags: [],
      essence_tags: [],
      theme_tags: [],
      location_hash: location_hash_param_list,
      yelp_craft: yelp_craft_param_list,
      twitter_craft: twitter_craft_param_list,
      website_craft: website_craft_param_list,
      facebook_craft: facebook_craft_param_list
    ]
  end

  def yelp_craft_param_list
    web_craft_param_list + [
    ]
  end

  def twitter_craft_param_list
    web_craft_param_list + [
    ]
  end

  def website_craft_param_list
    web_craft_param_list + [
    ]
  end

  def facebook_craft_param_list
    web_craft_param_list + [
    ]
  end

  def web_craft_param_list
    [
      :web_craft_id,
      :username,
      :href,
      :name,
      :description
    ]
  end

  def location_hash_param_list
    [
      :country,
      :street,
      :street2,
      :city,
      :state,
      :postal_code,
    ]
  end
end