class StaticPagesController < ApplicationController
    skip_before_action :require_login, only: %i[top] # トップページはログイン不要
    def top; end
end
