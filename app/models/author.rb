class Author < ApplicationRecord
  has_many :articles
  
  authenticates_with_sorcery!
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates :username, uniqueness: true
  validates :email, uniqueness: true
end
