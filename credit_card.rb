REGEX = /^(?<first_digit>\d)\d{15}$/

def credit_card_check(credit_card_number)
  credit_card_number.gsub!(' ', '')

  if credit_card_number.match?(REGEX) && valid_luhn(credit_card_number)
    result = "Valid Visa credit card number" if credit_card_number.match(REGEX)['first_digit'] == "4"
    result = "Valid Mastercard credit card number" if credit_card_number.match(REGEX)['first_digit'] == "5"
  else
    result = "Invalid credit card number"
  end

  result
end


def valid_luhn(credit_card_number)
  sum = 0
  credit_card_number.gsub(' ', '').split('').map{|i| i.to_i}.each_with_index do |number, index|
    if index.even?
      sum += (number * 2) % 9
    else
      sum += number
    end
  end

  sum % 10 == 0
end
