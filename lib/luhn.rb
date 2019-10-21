module Luhn
  def self.is_valid?(number)

    # break digits into individual numbers
    digits = number.to_s.split('').map(&:to_i)

    doubles = []
    # start from right, double every second digits
    digits.reverse.each_with_index do |n,index|
      if index % 2  == 0
        doubles << n
      else
        doubles << n * 2
      end
    end

    # If the doubled value is greater than or equal to 10, take the value and subtract 9 from it
    doubles_sub = []
    doubles.each do |dig|
      if dig >= 10
        doubles_sub << (dig - 9)
      else
        doubles_sub << dig
      end
    end

    #Sum the digits.
    sum = 0
    doubles_sub.each { |a| sum += a }

    #If the sum is divisible by 10, it's a valid number. Otherwise it's invalid.
    if sum % 10 == 0
      return true
    else
      return false
    end
  end
end
   #Luhn.cc_valid?(4194560385008504)
