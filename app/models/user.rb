class User < ApplicationRecord
  has_many :comments, :as => :imageable
  has_many :answers, :as => :imageable2
  has_many :questions
  serialize :qvalidation
  


  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  
  before_create :create_activation_digest


  validates :name, presence: true, length: {maximum:50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive:false}
  validates :password, presence: true, length: {minimum:6}
  has_secure_password


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end



  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def downcase_email
    self.email = email.downcase

  end

  def had_voted?(id)
     self.qvalidation["#{id}"]
    
  end



 

  private
  def create_activation_digest
    self.activation_token =  User.new_token
self.activation_digest = activation_token.to_s
  end




end
