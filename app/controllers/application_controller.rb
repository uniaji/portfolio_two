class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    # before_action :authenticate_user!
    protect_from_forgery
    # with: :exception

    def set_current_user
        @current_user = User.find_by(id: session[:user_id])
    end

    def after_sign_in_path_for(resource)
        root_path
    end

    private
        def move_to_signed_in
            unless user_signed_in?
            #サインインしていないユーザーはログインページが表示される
            redirect_to  '/'
            end
        end

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
            devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image, :profile])
        end
end
