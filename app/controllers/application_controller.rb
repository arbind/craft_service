class ApplicationController < ActionController::Base
  before_action :timestamp_action_time

  protect_from_forgery with: :null_session

  def render *args
    calculate_action_time
    super
  end

private
  def timestamp_action_time() @action_time = Time.now end
  def calculate_action_time() @action_time = Time.now - @action_time end
end