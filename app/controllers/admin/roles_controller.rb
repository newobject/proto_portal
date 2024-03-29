class Admin::RolesController < AdminController
  def index
    @roles = Role.all
    
    respond_to do |format|
      format.html
      format.json { render json: @roles }
    end
  end
  
  def show
    @role = Role.find(params[:id])
    @apps = App.all

    respond_to do |format|
      format.html
      format.json { render json: @role }
    end
  end
  
  def new
    @role = Role.new

    respond_to do |format|
      format.html
      format.json { render json: @role }
    end
  end
  
  def edit
    @role = Role.find(params[:id])
  end
  
  def create
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to admin_role_path(@role), notice: 'Role was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @role = Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:role])
        format.html { redirect_to admin_role_path(@role), notice: 'Role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to admin_roles_url }
      format.json { head :no_content }
    end
  end
  
end
