class User < ApplicationRecord
  before_validation { email.downcase! }
  before_destroy :not_destroy_no_admin
  before_update :not_update_no_admin

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  
  
  has_secure_password
  validates :password, length: { minimum: 6 }, presence: true
  has_many :tasks, dependent: :destroy

  enum admin: {yes: true, no: false}
  validates :admin, inclusion: {in: ["yes", "no"]}

  private

  def not_destroy_no_admin
      if User.where(admin: true).count == 1 && self.admin == "yes"
        errors.add(:base, "管理者が0人になるため削除できません")
        throw :abort #処理の停止
      end
  end

  def not_update_no_admin
    if User.where(admin: :true).count == 1 && self.admin_change == ["yes","no"]
      errors.add(:base, "管理者が0人になるため権限を変更できません")
      throw :abort #処理の停止
    end
  end
end
