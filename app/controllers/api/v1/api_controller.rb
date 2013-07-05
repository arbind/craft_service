class Api::V1::ApiController < ApplicationController
  layout 'api_v1'
  protect_from_forgery with: :null_session
  rescue_from Exception, :with => :render_exception

private

  def render_exception(exception)
    @status = exception.code if exception.respond_to? :code
    @status ||= 404 if exception.kind_of? Mongoid::Errors::DocumentNotFound
    @status ||= 500
    response.status = @status

    @error = exception.message if exception.respond_to? :message
    @error ||= exception.to_s
    render template: "api/v1/error"
  end

end