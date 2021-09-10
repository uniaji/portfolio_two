class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    super
    @user = User.new
  end

  def create
    super
    @user = User.new
    @user.image = 'default.jpeg'
  end

  def edit
    super
  end

  def update
    super
    @user.save
      # redirect_to user_path(current_user), notice: 'プロフィールを更新しました'
    # else
      # render edit_user_registration_path
    # end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'ユーザー情報を削除しました！'
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   user_path(id: current_user.id)
  # end


  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:update) do |u|
  #     u.permit(:name, :email, :password, :password_confirmation, :current_password)
  #   end
  # end
  # def after_update_path_for(resource)
  #   user_path(id: current_user.id)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
