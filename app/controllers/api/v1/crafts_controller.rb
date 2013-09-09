class Api::V1::CraftsController < Api::V1::ApiController
  before_action :set_craft_from_data,  only: [:materialize]
  before_action :set_craft,  only: [:show, :update, :destroy]
  before_action :set_crafts, only: [:index]

  # POST /materialize
  def materialize
    if @craft.nil?
      @craft = Craft.create! craft_params
    else
      @craft.update_attributes! craft_params
    end
    render template: '/api/v1/crafts/show', status: 201
  end

  # GET /crafts
  def index
  end

  # GET /craft/1
  def show
  end

  # POST /api/v1/crafts/:id
  def create
    @craft = Craft.create! craft_params
    render template: '/api/v1/crafts/show', status: 201
  end

  # PATCH /api/v1/crafts/:id
  def update
    @craft.update_attributes! craft_params
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

  def set_craft_from_data
    craft_path = craft_params['craft_path']
    return nil unless craft_path
    craft_id = craft_path.split('/').last
    @craft = Craft.find craft_id
    return @craft if @craft.present?
    twitter_craft = craft_params['twitter_craft']
    yelp_craft = craft_params['yelp_craft']
    return unless twitter_craft and yelp_craft
    twitter_id = twitter_craft['web_craft_id']
    yelp_id = yelp_craft['web_craft_id']
    @craft = Craft.where('twitter_craft.web_craft_id' => twitter_id).and('yelp_craft.web_craft_id' => yelp_id).first
  end

  def craft_params
    @craft_params ||= params.require(:craft).permit(craft_param_list)
  end


  def craft_param_list
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
      :phone,
      :image_url,
      :categories,
    ]
  end

  def twitter_craft_param_list
    web_craft_param_list + [
      :lang,
      :is_protected,
      :friends_count,
      :followers_count,
      :statuses_count,
      :favourites_count,
      :listed_count,
      :profile_text_color,
      :profile_link_color,
      :profile_image_url_https,
      :profile_background_tile,
      :profile_background_color,
      :profile_use_background_image,
      :profile_background_image_url_https,
      :profile_sidebar_border_color,
      :profile_sidebar_fill_color,
      :twitter_account_created_at,
    ]
  end

  def website_craft_param_list
    web_craft_param_list + [
    ]
  end

  def facebook_craft_param_list
    web_craft_param_list + [
      :likes,
      :first_name,
      :last_name,
      :about,
    ]
  end

  def web_craft_param_list
    [
      :web_craft_id,
      :username,
      :href,
      :name,
      :address,
      :description,
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