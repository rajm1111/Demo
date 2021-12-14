require_relative 'admin.rb'
require 'byebug'
class BookOperation
  $books = []
  @@app_books = []
  def initialize
    @args_list = ["Add a new book", "Delete a book", "List of books in library","Issued request list", "Return request list", "Back"]
  end

  def self.app_books
    @@app_books
  end

  def get_choice
    puts "\n"
    while true
      @args_list.each_with_index do|item, index|
        puts "\n#{index + 1}. #{item}"
      end
      print "\nPlease enter your choice : "
      user_choice = gets.chomp.to_i
      case user_choice
      when 1
        add_book
      when 2
        destroy
      when 3
        book_index
      when 4
        issued_request
      when 5
        return_request
      when 6
        break;
      else
        puts "\nInvalid choice !! Please enter the valid one and try again\n"
      end
    end
  end

  def add_book
    puts "\n-------- Add a new Book --------\n"
    print "\nPlease enter book id : "
    @id = gets.chomp.to_i
    print "Please enter book name : "
    @book_name = gets.chomp
    print "Please enter author name : "
    @author = gets.chomp
    $books.push({
        id: @id,
        book: @book_name,
        author: @author
      })
    if @id != "" && @book_name != "" && @author != ""
      puts "\nBook added successfully\n"
    else
      puts "Please enter all details of book"
      add_book
    end
  end

  def book_index
    puts "\n---------- Details of Books ----------\n"
    print "\nId       Name of Book     Author\n"
    $books.each do |book|
      book.each do |key, value|
        print "#{value.to_s}          "
      end
      puts "\n"
    end
  end

  def issued_request
    puts "\n---------- Issue Request ----------\n"
    print "\nId       Book     Author    Student Id\n"
    $issue_books.each do |book|
      @stud_email = book[:email]
      book.each do |key, value|
        print "#{value.to_s}      "
      end
      puts "\n"
    end

    request = ["Press 1 for approve request", "Press 2 for cancel request", "Back"]

    while true
      request.each_with_index do|item, index|
        puts "\n#{index + 1}. #{item}"
      end
      print "\nPlease enter your choice : "
      @user_choice = gets.chomp.to_i
      case @user_choice
        when 1
          approve_request
        when 2
          cancel_request
        when 3
          break
        else
          puts "\nInvalid choice !! Please enter the valid one and try again\n"
      end
    end
  end

  def approve_request
    if @user_choice == 1
      puts "\nPlease enter student id to approve request\n"
      @stud_id = gets.chomp

      $issue_books.each do |book|
        @stud_email = book[:email]
        if @stud_email == @stud_id
          @@app_books.push({
              id: book[:id],
              book: book[:book],
              author: book[:author],
              email: @stud_email
            })
        end
      end
    end
  end

  def cancel_request
    if @user_choice == 2
      puts "\nRequested canceled successfully\n"
    end
  end

  def return_request
    puts "\n---------- Return Request ----------\n"
    print "\nId       Book     Author    Student Id\n"
    $return_books.each do |book|
      @stud_email = book[:email]
      book.each do |key, value|
        print "#{value.to_s}          "
      end
      puts "\n"
    end

    request = ["Press 1 for approve return request", "Press 2 for cancel return request", "Back"]

    while true
      request.each_with_index do|item, index|
        puts "\n#{index + 1}. #{item}"
      end
      print "\nPlease enter your choice : "
      @user_choice = gets.chomp.to_i
      case @user_choice
        when 1
          approve_return_request
        when 2
          cancel_return_request
        when 3
          break
        else
          puts "\nInvalid choice !! Please enter the valid one and try again\n"
      end
    end

  end

  def approve_return_request
    if @user_choice == 1
      puts "\nPlease enter student id and book_id to approve return request\n"
      @stud_id = gets.chomp
      @book_id = gets.chomp

      $return_books.each do |book|
        $return_books.delete_if { |h| h[:id] == @book_id && h[:email] == @stud_id}
      end
    end
  end

  def cancel_return_request
    if @user_choice == 2
      puts "\nRequested canceled successfully\n"
    end
  end

  def destroy
    print "\nPlease enter book id which you want to delete : "
    book_id = gets.chomp.to_i
    if(book_id)
      $books.delete_if { |h| h[:id] == book_id }
      puts "\nBook deleted successfully\n"
    else
      print "\nInvalid book id. Please enter valid book id and try again  : "
      destroy
    end
  end
end




