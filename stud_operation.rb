require_relative 'admin.rb'
require_relative 'stud_loggedin.rb'
require_relative 'student.rb'
require 'byebug'

class StudOperation
  def initialize
    @auth = ["Register as a Student", "Delete Student", "List of Students", "Back"]
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
          destroy
        when 3
          student_list
        when 4
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
    Student.users.push({
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

  def destroy
    print "\nPlease enter student email id which you want to delete : "
    stud_id = gets.chomp
    if(stud_id)
      Student.users.delete_if { |h| h[:email] == stud_id }
      puts "\nStudent deleted successfully\n"
    else
      print "\nInvalid student id. Please enter valid id and try again  : "
      destroy
    end
  end

  def student_list
    puts "\n---------- List of Students ----------\n"
    print "\nName      Email\n"
    Student.users.each do |student|
      print "#{student[:fname]} #{student[:lname]}       "
      print "#{student[:email]}       "
      puts "\n"
    end
    puts "\n"
  end
end






