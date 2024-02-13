class User <ApplicationRecord 
  validates_presence_of :email, :name 
  validates_uniqueness_of :email
  validates :password, presence: true
  
  has_many :viewing_parties

  has_secure_password
end 