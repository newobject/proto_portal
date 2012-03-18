class Admin::NavNodesController < AdminController
  def create
    @nav_node = NavNode.new(params[:nav_node])
    
    respond_to do |format|
      if @nav_node.save
        format.json { render json: @nav_node, status: :created, location: admin_nav_node_path(@nav_node) }
      else
        format.json { render json: @nav_node.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @nav_node = NavNode.find(params[:id])
    @nav_node.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end
end
