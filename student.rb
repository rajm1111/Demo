require_relative 'home.rb'
require_relative 'stud_loggedin.rb'
require 'byebug'

class Student
  @@users = []
  def initialize
    @auth = ["Register", "Login", "Back"]
  end

  def self.users
    @@users
  end

  def get_choice
    puts "\n"
    while true
      @auth.each_with_index do|item, index|
        puts "\n#{index + 1}. #{item}"
      end
      print "\nPlease enter your choice : "
      user_choice = gets.chomp.to_i
      case user_choice
        when 1
          register
        when 2
          login
        when 3
          break
        else
          puts "\nInvalid choice !! Please enter the valid one and try again\n"
      end
    end
  end

  def register
    puts "\n----------- Register -----------\n"
    print "Plese enter your first name: "
    @fname = gets.chomp
    print "Plese enter your last name: "
    @lname = gets.chomp
    print "Plese enter your email address: "
    @email = gets.chomp
    print "Plese enter your password: "
    @pass = gets.chomp
    @@users.push({
        fname: @fname,
        lname: @lname,
        email: @email,
        password: @pass
      })
    if @fname != "" && @lname != "" && @email != "" && @pass != ""
      puts "\nLogin Successfully !! Chosse any option to continue..\n"
      StudentLogin.new.user_choice(@email)
    else
      puts "\nPlease enter your all details\n"
    end
  end

  def login
    puts "\n----------- Login -----------\n"
    print "Plese enter your email id: "
    uname = gets.chomp
    print "Plese enter your password: "
    pass = gets.chomp
    @@users.each do |user|
      if uname == user[:email] && pass == user[:password]
        @user_email = user[:email]
        puts "\nLogin Successfully !! Chosse any option to continue..\n"
        StudentLogin.new.user_choice(@user_email)
      end
    end
  end
end






