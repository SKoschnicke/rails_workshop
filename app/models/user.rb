class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # this is all done by the "devise" module
  # validates :email, uniqueness: true
  validates :name, allow_blank: false, presence: true

  has_and_belongs_to_many :teams
end
