class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  has_ancestry
  has_and_belongs_to_many :roles
  has_many :leaves

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def manager?
    self.roles.first.name == "manager"
  end

  def fullname
  "#{first_name} #{last_name}"
end

end
