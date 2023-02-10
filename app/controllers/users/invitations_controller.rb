# frozen_string_literal: true

module Users
  class InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_params
    skip_before_action :authenticate_user!, only: %i[edit update]

    def policy_class
      InvitationPolicy
    end

    def new
      authorize :invitation, :new?
      super
    end

    def create
      authorize :invitation, :create?
      super do |resource|
        resource.name = params[:user][:name]
        resource.type = params[:user][:type]
        resource.save
      end
    end

    def edit
      authorize :invitation, :edit?
      super
    end

    def update
      authorize :invitation, :update?
      super
    end

    protected

    def configure_permitted_params
      devise_parameter_sanitizer.permit(:user, keys: %i[picture name email type])
    end
  end
end
