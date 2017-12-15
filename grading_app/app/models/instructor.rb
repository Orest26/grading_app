class Instructor < ActiveRecord::Base
  
  EMAIL_FORMAT= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  PASSWD_FORMAT= /\A.*(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*\z/
  validates_uniqueness_of :email
  validates :name, :length => {:maximum => 25}, :presence => true
  validates :surname, :length => {:maximum => 25}, :presence => true
  validates :email, :presence => true, :format => {:with => EMAIL_FORMAT , :message => "email in wrong format"}
  validates :password, :presence => true, :length => {:minimum => 6}, :format => {:with => PASSWD_FORMAT, :message => "wrong password format"}
  
  validates_uniqueness_of :email
  has_many :students, through: :courses
  def matches_password?(password)
      self.password == password
  end
  
end