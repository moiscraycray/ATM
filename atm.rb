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

@balance = 1000

puts
puts "Hello, welcome to Awesome ATM."

#users encounter menu first and enter their preference
def menu
  puts "\nWould you like to: \n\n"
  puts "Make a [w]ithdrawal"
  puts "Check your [b]alance"
  puts "Make a [d]eposit"
  puts "E[x]it"
  @input = gets.chomp.downcase

#Depending on user input from menu, the following case will call the respective method
  case @input
    when "w"
      withdrawal
    when "b"
      bal
    when "d"
      deposit
    when "x"
      puts "\n\nThank you for using Awesome ATM. Have a good day :)\n\n"
      exit
    else
      puts "\nInvalid input, please try again.\n\n"
      menu
  end
end

#Simple method showing their account balance
def bal
  puts "You have $#{@balance} in your account. \n\n"
  menu #calls the menu method to enable user input again
end

def withdrawal
  puts "How much would you like to withdraw? Press [b] to go back to menu.\n\n"
  @num = gets.chomp

=begin
This code block will determine whether user wants to go back to menu.
If they enter an integer, the code will convert user-input to integer from string.
=end
  back = 0
  if @num == "b"
    back = 1 #This ensures the next if/else code does NOT run
    menu
  else
    back = 0 #This ensures the next if/else code runs
    @with = @num.to_i #This converts user-input to integer
  end

  if back == 0
    if (@with > 0) && (@with <= @balance)
      @balance -= @with
      puts "\nPlease take your money.\n\n"
      puts "Your remaining balance is $#{@balance}. \n\n\n"
      menu
    elsif @with > @balance
      puts "You have insufficient funds. Please enter smaller amount."
      withdrawal
    else
      puts "\nInvalid input, please try again.\n\n" #This runs if user entered 0/negative integer/strings
      withdrawal
    end
  end

end

def deposit
  puts "How much would you like to deposit? Press [b] to go back to menu.\n\n"
  @num = gets.chomp

=begin
This code block uses the same code from withdrawal for the 'back' feature.
=end
  back = 0
  if @num == "b"
    back = 1
    menu
  else
    back = 0
    @dep = @num.to_i
  end

  if back == 0
    if (@dep < 10000) && (@dep > 0)
      @balance += @dep
      puts "\nYou have deposited $#{@dep} into your account.\n\n\n"
      menu
    elsif @dep >= 10_000
      @balance += @dep
      puts "\nYou have deposited $#{@dep} into your account.\n"
      puts "Your deposit has exceeded the threshold transaction. A record will be sent to AUSTRAC.\n\n\n"
      menu
    else
      puts "\nInvalid input, please try again.\n\n"
      deposit
    end
  end

end

menu
