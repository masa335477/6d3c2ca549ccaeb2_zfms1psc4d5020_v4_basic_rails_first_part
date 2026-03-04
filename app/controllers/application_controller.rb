class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user
    before_action :require_login # ログイン許可

    def logged_in?
        !!current_user
    end

    def logout
        session[:user_id] = nil
        @current_user = nil
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    add_flash_types :success, :danger

    private

    def require_login
        redirect_to login_path, danger: t('defaults.flash_message.require_login') unless logged_in?
    end
end
