class Role < ActiveRecord::Base
  has_many :role_nav_nodes, :dependent => :delete_all
  
  def include?(nav_node)
    return false if self.role_nav_nodes.select{|rnn| rnn.nav_node == nav_node}.empty?
    true
  end
end
