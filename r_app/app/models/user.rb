class User < ActiveRecord::Base
	has_and_belongs_to_many :projects
	 attr_accessor :password
  before_save :encrypt_password
  
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :password, format:{with: /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}\z/, message: " - Should contain 1 Uppercase, 1 Number, 1 Special Character and should be of minimum 8 Characters."} 
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
 
end
