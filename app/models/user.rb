class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :properties
         has_many :tenants
         has_many :agreements
         has_many :due_types
         has_many :dues
         has_many :agreements
end
