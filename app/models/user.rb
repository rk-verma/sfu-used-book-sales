<<<<<<< HEAD
class User < ActiveRecord::Base
  has_many :books
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   # existing code

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :username
  validates_uniqueness_of :username
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end
  
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    super && provider.blank?
  end
 
 
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
=======
# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  provider   :string
#  uid        :string
#  name       :string
#  location   :string
#  image_url  :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base

    def self.from_omniauth(auth)
      find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
    end
  class << self
    def from_omniauth(auth_hash)


      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.name = auth_hash['info']['name']
      user.email = get_email_for user.provider, auth_hash['info']['email']
      
      user.location = get_social_location_for user.provider, auth_hash['info']['location']
      user.image_url = get_image_for user.provider, auth_hash['info']['image']
       
      user.url = get_social_url_for user.provider, auth_hash['info']['urls']
      user.save!
      user
       
     end
     private

    def get_social_location_for(provider, location_hash)
      case provider
        when 'linkedin'
          location_hash['name']
        else
          location_hash
      end
    end
    
    def get_image_for(provider, image_hash)
      case provider 
        when 'identity'
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/48px-User_icon_2.svg.png"
        else
          image_hash
      end
    end
    
    def get_social_url_for(provider, urls_hash)
      case provider
        when 'identity'
          
        else
          urls_hash
      end
    end
    
    def get_email_for(provider, email_hash)
      case provider
        when 'twitter'
          "No email currently available"
        else
          email_hash
      end
    end
    
  end


>>>>>>> f35313dac63ed0e3dd3a108a401f168eca043220
end
