class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

#  base de la regex (^/[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}/$)

  validates :nickname, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :phone_number, format: { with: /[+]?[(]?[0-9]{3}[)]?[-s.]?[0-9]{3}[-s.]?[0-9]{4,6}/,
    message: "Entrez une donnée valide" }
  validates :phone_number, uniqueness: true
  validates :email, uniqueness: true

end
