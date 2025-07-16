class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
  has_many :jobs, dependent: :destroy

  # Devise handles password presence and length validation
end
