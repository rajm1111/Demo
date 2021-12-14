require_relative 'student.rb'
require_relative 'book_operation.rb'
require 'byebug'
class StudentLogin
  $issue_books = []
  $return_books = []
  attr_reader:length_quit
  def initialize
    @args_list = ["Create issue request", "Create return request", "My purchased books", "View Profile", "Logout"]
    @length_quit = @args_list.length
  end



  def user_choice(user_id)
    @user_email = user_id
    puts "\n"
    while true
      @args_list.each_with_index do|item, index|
        puts "\n#{index + 1}. #{item}"
      end
      print "\nPlease enter your choice : "
      user_choice = gets.chomp.to_i
      case user_choice
      when 1
        issue_request
      when 2
        return_request
      when 3
        books_list
      when 4
        profile
      when 5
        puts "\nLogout successfully\n"
        break;
      else
        puts "\nInvalid choice !! Please enter the valid one and try again\n"
      end
    end
  end

  def issue_request
    puts "\n---------- Available books in library ----------\n"
    print "Id       Name of Book     Author\n"
    $books.each do |book|
      book.each do |key, value|
        print "#{value.to_s}          "
      end
      puts "\n"
    end
    print "\n\nTo issue a book please enter book id: "
    @book_id = gets.chomp.to_i
    $books.each do |h|
      if @book_id == h[:id]
        $issue_books.push({
          id: h[:id],
          book: h[:book],
          author: h[:author],
          email: @user_email
        })
        puts "\nBook requested successfully\n"
      end
    end
  end

  def return_request
    puts "\n---------- My Books ----------\n"
    print "Id       Book     Author\n"
    if @user_email
      BookOperation.app_books.each do |book|
        print "#{book[:id]}      "
        print "#{book[:book]}      "
        print "#{book[:author]}      "
        puts "\n"
      end
    end
    puts "\n"
    puts "\nPlease enter book id which you want to return\n"
    @book_id = gets.chomp.to_i
    BookOperation.app_books.each do |h|
      if @book_id == h[:id]
        $return_books.push({
          id: h[:id],
          book: h[:book],
          author: h[:author],
          email: @user_email
        })
        puts "\nBook return successfully\n"
      end
    end


  end

  def books_list
    puts "\n---------- My purchased books list ----------\n"
    print "\nId       Book     Author    Request\n"
    if @user_email
      BookOperation.app_books.each do |book|
        print "#{book[:id]}      "
        print "#{book[:book]}      "
        print "#{book[:author]}     "
        print "Approved"
        puts "\n"
      end
    end
    # BookOperation.app_books.delete_if { |h| h[:email] == @user_email }
  end

  def profile
    Student.users.each do |user|
      if @user_email == user[:email]
        puts "\nName: #{user[:fname]} #{user[:lname]}\n"
        puts "\nEmail: #{user[:email]}\n"
        puts "\nPassword: #{user[:password]}"
      end
    end
  end
end









