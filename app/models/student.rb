require_relative '../../db/config'



class Student < ActiveRecord::Base
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }
  validates :email, :format => { :with => /(.+)@(.+)\.(.{2,})/ }
  validates :email, :uniqueness => true
  validates :phone, :format => {:with => /(\+\d{1,3}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4} /}

  def name
    name = self.first_name + " "
    name << self.last_name
    name
  end

  def age
    now = Date.today
    age = now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end
end