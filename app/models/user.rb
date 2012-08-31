require 'digest/sha2'

class User
include MongoMapper::Document

  key :user_id, ObjectId
  key :name, String, :required => true, :unique => true
  key :hashed_password, String
  key :email, String
  key :salt, String
  key :admin, Boolean
  timestamps!

  attr_accessible :name, :password, :password_confirmation

  validate :password_must_be_present

  def User.authenticate(name, password)
    if user = find_by_name(name)
      if user.hashed_password == encrypt_password(password, user.salt)
        user
      end
    end
  end

  def User.encrypt_password(password, salt)
    Digest::SHA2.hexdigest(password + "nerd" + salt)
  end

  def password=(password)
    @password = password
    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  private
    def password_must_be_present
      errors.add(:password, "You missed your password") unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
