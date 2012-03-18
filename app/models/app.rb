class App < ActiveRecord::Base

  def self.authenticate(code, secret)
    where("code = ? AND secret = ?", code, secret).first
  end
end
