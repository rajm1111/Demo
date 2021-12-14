require_relative 'admin.rb'
require_relative 'student.rb'
class Home
  def initialize
    @lib_users = ["Admin Login", "Student Login", "Exit"]
  end



  def get_choice
    puts "\n----------- Library Management System -----------\n"
    while true
      @lib_users.each_with_index do|item, index|
        puts "\n#{index + 1}. #{item}"
      end
      print "\nPlease enter your choice : "
      choice = gets.chomp.to_i
      case choice
        when 1
          Admin.new.login
        when 2
          Student.new.get_choice
        when 3
          break;
        else
          puts "\nInvalid choice !! Please enter the valid one and try again\n"
      end
    end
  end
end


