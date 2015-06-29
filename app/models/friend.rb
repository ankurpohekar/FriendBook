class Friend < ActiveRecord::Base
  validates :fname, presence: true
  validates :lname,presence: true 
  validates_plausible_phone :mobile, :country_number => '91'
  has_attached_file :fimage, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :fimage, content_type: /\Aimage\/.*\Z/

  def full_name
  	"#{self.fname.capitalize}  #{self.lname.capitalize}"
  end
  belongs_to :user
end
