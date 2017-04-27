class User < ApplicationRecord
  before_save :encrypt_password

  def encrypt_password
    self.password = Digest::MD5.hexdigest(password)
  end

end
