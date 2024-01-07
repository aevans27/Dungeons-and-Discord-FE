class Users::OmniauthorCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_account!

  def discord
    require 'pry';binding.pry
      @user = User.from_omniauth(request.env["omniauth.auth"])

      sign_in(:account, @user)


      # in my case response was incorrect, so I made it by myself.
      redirect_to after_sign_in_path_for(@user),
                notice: t('devise.omniauth_callbacks.success', kind: @user.provider)
  end
end