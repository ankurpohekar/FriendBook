class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end
  #validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :fname, presence: true 
  validates_email_format_of :email, :message => 'Enter valid Email'
  validates :lname,presence: true 
  validates :mobile,presence: true
  #validates :mobile, :country_number => '91'
  validates_plausible_phone :mobile, :country_number => '91'
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def full_name
  	"#{self.fname.capitalize}  #{self.lname.capitalize}"
  end
  #has_many :friends
  has_many :friend_requests
end
