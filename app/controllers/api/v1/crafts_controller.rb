class Api::V1::CraftsController < Api::V1::ApiController
  before_action :set_craft,  only: [:show]
  before_action :set_crafts, only: [:index]

  # GET /crafts
  def index
  end

  # GET /craft/1
  def show
  end

  private
    def set_crafts
      @crafts = Craft.all
    end

    def set_craft
      @craft = Craft.find(params[:id])
    end
end