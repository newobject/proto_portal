class Api::V1::AppsController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    app_names = UserAppRole.where("user_id = ?", params[:user_id]).map{ |user_app_role| { name: user_app_role.app.name, domain: user_app_role.app.domain } }
    
    respond_to do |format|
      format.json { render json: app_names, callback: params[:callback] }
    end
  end
end
