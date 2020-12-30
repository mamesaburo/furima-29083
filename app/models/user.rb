class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :purchased_items
  
  with_options presence: true do
    validates :nickname, uniqueness: { case_sensitive: true }
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    validates :password, confirmation: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Include both letters and numbers" }
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    validates :birth

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: "Full-width characters" } do
      validates :last_name
      validates :first_name
    end
    
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width characters" } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end