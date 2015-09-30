class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :username

  def fizzbuzz(num=rand(100))
    case
    when num % 30 == 0 then 'fizzbuzz'
    when num % 10 == 0 then 'buzz'
    when num % 3  == 0 then 'fizz'
    else 'Cicada!'
    end
  end
end
