class Users < ActiveRecord::Base
  validates :name, format: { without: /[0-9]/, message: "does not allow numbers" }
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :password
end