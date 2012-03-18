class Admin::UserAppRolesController < AdminController
  def create
    @user_app_role = UserAppRole.new(params[:user_app_role])
    @user_app_role.user_id = current_user.id

    uar = UserAppRole.where("user_id = ? AND app_id = ?", current_user.id, @user_app_role.app_id).first
    uar.destroy if uar
    
    respond_to do |format|
      if @user_app_role.save
        format.json { render json: @user_app_role.to_json(:include => [:app, :role]), status: :created, location: admin_user_app_role_path(@user_app_role) }
      else
        format.json { render json: @user_app_role.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @user_app_role = UserAppRole.find(params[:id])
    @user_app_role.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
