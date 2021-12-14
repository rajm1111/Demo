require_relative 'home.rb'
require_relative 'stud_operation.rb'
require_relative 'book_operation.rb'
require 'byebug'

module ModAdmin
  def load_home
    Home.new.get_choice
  end
end

class Admin
  include ModAdmin
  def initialize
    @auth = ["Student Operations", "Book Operations", "Logout"]
  end

  def login
    puts "\n----------- Admin Login -----------\n"
    print "Plese enter your username: "
    uname = gets.chomp
    print "Plese enter your password: "
    pass = gets.chomp
    if uname == "admin" && pass == "12345"
      puts "\nLogin Successfully !! Chosse any option to continue.."
       get_choice
    else
      puts "\nInvalid Credentials. Please check your Credentials and try again\n"
    end
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
          StudOperation.new.get_choice
        when 2
          BookOperation.new.get_choice
        when 3
          break
        else
          puts "\nInvalid choice !! Please enter the valid one and try again\n"
      end
    end
  end
end

Admin.new.load_home






