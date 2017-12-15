class Student < ActiveRecord::Base
  
  EMAIL_FORMAT= /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  PASSWD_FORMAT= /\A.*(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*\z/
  validates :name, :length => { :maximum => 30}, :presence => true
  validates :surname, :length => { :maximum => 30}, :presence => true
  validates_uniqueness_of :email
  validates :email, :presence => true, :format => {:with => EMAIL_FORMAT, :message => "wrong email"}
  validates :password, :presence => true, :length => {:minimum => 8}, :format => {:with => PASSWD_FORMAT, :message => " wrong format"}
  
  has_many :grades
  has_and_belongs_to_many :courses
  has_many :instructors, through: :courses
  
  def matches_password?(password)
      self.password == password
  end
  
end