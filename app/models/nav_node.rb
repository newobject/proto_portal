class NavNode < ActiveRecord::Base
  belongs_to :app
  has_many :role_nav_nodes, :dependent => :delete_all
  
  def link
    has_sep = false
    
    l = app.domain
    has_sep = true if l.end_with?('/')
    has_sep = true if self.url.start_with?('/')
    l += '/' unless has_sep
    
    l += self.url
  end
end