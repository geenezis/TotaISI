class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, through: :project_associations
  has_many :project_associations
  has_many :invitations, dependent: :destroy
  has_many :tasks
  has_many :comments, dependent: :destroy

  def to_s
    email
  end
end
