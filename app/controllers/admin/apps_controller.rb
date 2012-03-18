class Admin::AppsController < AdminController
  def index
    @apps = App.all
    
    respond_to do |format|
      format.html
      format.json { render json: @apps }
    end
  end
  
  def show
    @app = App.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @app }
    end
  end
  
  def new
    @app = App.new

    respond_to do |format|
      format.html
      format.json { render json: @app }
    end
  end
  
  def edit
    @app = App.find(params[:id])
  end
  
  def create
    @app = App.new(params[:app])

    respond_to do |format|
      if @app.save
        format.html { redirect_to admin_app_path(@app), notice: 'App was successfully created.' }
        format.json { render json: @app, status: :created, location: @app }
      else
        format.html { render action: "new" }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @app = App.find(params[:id])

    respond_to do |format|
      if @app.update_attributes(params[:app])
        format.html { redirect_to admin_app_path(@app), notice: 'App was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @app.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @app = App.find(params[:id])
    @app.destroy

    respond_to do |format|
      format.html { redirect_to admin_apps_url }
      format.json { head :no_content }
    end
  end
end
