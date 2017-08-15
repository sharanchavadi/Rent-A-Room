class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :cities
  has_many :aminities
  belongs_to :role
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :username, :email, :mobile
  validates_numericality_of :mobile, :role_id
  validates_length_of :mobile, is:10

  after_create :setup_user_role

  def role?(role)
     self.roles.pluck(:name).include? role
  end 

  private
  def setup_user_role
     User.create(role_id: Role.find_by(name: "user").id)
   end

end
