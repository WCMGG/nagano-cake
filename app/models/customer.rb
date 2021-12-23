class Customer < ApplicationRecord

  has_many :addresses
  has_many :cart_items

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 退会機能
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

end
