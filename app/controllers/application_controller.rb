# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_attributes, if: :devise_controller?
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  rescue_from ActiveRecord::RecordNotFound, with: :no_record

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: 'pundit', default: :default
    redirect_to root_path
  end

  def no_record
    redirect_to root_path, alert: 'Whoops, record not found'
  end

  def configure_permitted_attributes
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type name])
  end
end
