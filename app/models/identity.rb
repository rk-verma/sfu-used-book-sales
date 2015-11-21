class Identity < OmniAuth::Identity::Models::ActiveRecord
  before_save {self.email = email.downcase}
	validates :name, presence: true, length: { maximum: 50}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
	format: { with: VALID_EMAIL_REGEX },
	uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
	# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  validates_presence_of :name
  validates_uniqueness_of :email
  has_secure_password
  validates_format_of :email, :with => /[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}/i
  validates :password, length: { minimum: 6, maximum: 32 }
end