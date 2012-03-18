class Api::V1::NavNodesController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def index
    nav_nodes = RoleNavNode.joins("join roles on role_nav_nodes.role_id = roles.id join nav_nodes on role_nav_nodes.nav_node_id = nav_nodes.id join user_app_roles on user_app_roles.app_id = nav_nodes.app_id and user_app_roles.role_id = role_nav_nodes.role_id and user_app_roles.role_id = roles.id").where("user_app_roles.user_id = ?", params[:user_id]).map{ |role_nav_node| { id: role_nav_node.id, app_name: role_nav_node.nav_node.app.name, name: role_nav_node.nav_node.name, url: role_nav_node.nav_node.link } }
    
    nav_nodes_map = {}
    nav_nodes.each do |nav_node|
      app_nav_nodes = nav_nodes_map[nav_node[:app_name]]
      
      unless app_nav_nodes
        app_nav_nodes = [{
          id: nav_node[:id],
          name: nav_node[:name],
          url: nav_node[:url]
        }]
        nav_nodes_map[nav_node[:app_name]] = app_nav_nodes
      end
      
      app_nav_nodes << {
        id: nav_node[:id],
        name: nav_node[:name],
        url: nav_node[:url]
      }
    end
    
    respond_to do |format|
      format.json { render json: nav_nodes_map }
    end
  end
end
