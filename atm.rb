=begin
Create a terminal app that behaves like an ATM.
includes:
pin
fees
accounts
language

requirements:
withdrawl
check balance
deposit
greetings

MVP = minimal viable product
=end

=begin
greeting then method of menu. Include 'back' button
=end

@balance = 1000.0

puts "Hello, welcome to awesome ATM."

def menu
  puts "Would you like to: \n\n"
  puts "Make a [w]ithdrawal"
  puts "Check your [b]alance"
  puts "Make a [d]eposit"
  puts "[E]xit"
  @input = gets.chomp.downcase

  case @input
    when "w"
      withdrawal
    when "b"
      bal
    when "d"
      deposit
    when "e"
      exit
    else
      puts
      puts "Invalid input, please try again."
      menu
  end
end

def bal
  puts "You have #{@balance} in your account. \n\n"
  menu
end

def withdrawal
  puts "How much would you like to withdraw?"
  begin
    @with = Integer(gets.chomp.to_f)
    rescue ArgumentError
    puts "Invalid input, please try again"
    retry
  end
  @balance = @balance - @with
  puts "Please take your money.\n\n"
  puts "Your remaining balance is #{@balance}. \n\n"
  menu
end

def deposit
  puts "How much would you like to deposit?"
  begin
    @dep = Integer(gets.chomp.to_f)
    rescue ArgumentError
    puts "Invalid input, please try again"
    retry
  end
  @balance += @dep
  puts "You have deposited #{@balance} into your account."
  menu
end

def exit
  puts "Thank you for using Awesome ATM. Have a good day :)"
end
