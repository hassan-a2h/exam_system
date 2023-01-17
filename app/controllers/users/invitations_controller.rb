
module Users
  class InvitationsController < Devise::InvitationsController
    before_action :configure_permitted_params

    def create
      super do |resource|
        resource.name = params[:user][:name]
        resource.type = params[:user][:type]
        resource.save
      end
    end

    protected

    def configure_permitted_params
      devise_parameter_sanitizer.permit(:user, keys: [:name, :email, :type])
    end
  end
end
