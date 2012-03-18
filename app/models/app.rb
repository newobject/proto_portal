class App < ActiveRecord::Base
  has_many :nav_nodes, :dependent => :delete_all

  def self.authenticate(code, secret)
    where("code = ? AND secret = ?", code, secret).first
  end
end
