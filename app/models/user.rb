class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, uniqueness: { case_sensitive: true }
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, confirmation: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Include both letters and numbers" }
  validates :password_confirmation, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters" }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters" }
  validates :birth, presence: true
end