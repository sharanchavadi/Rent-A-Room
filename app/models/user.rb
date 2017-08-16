class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :cities
  has_many :aminities
  has_many :rooms
  belongs_to :role
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :username, :email, :mobile
  validates_numericality_of :mobile
  validates_length_of :mobile, is:10

  after_create :setup_user_role

  def role?(role)
     self.role.name == role
  end 

  private
  def setup_user_role
     self.role_id = Role.find_by(name: "guest").id
     self.save
  end

end
