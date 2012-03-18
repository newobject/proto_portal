class NavNode < ActiveRecord::Base
  belongs_to :app
  has_many :role_nav_nodes, :dependent => :delete_all
  
  def link
    l = app.domain
    l += '/' unless l.end_with?('/')
    l += self.url
  end
end