require_relative 'home.rb'
require_relative 'student.rb'
class AdminLogin
  $books = []
  def initialize
    @args_list = ["Add a new book", "Delete a book", "List of books in library", "List of Students", "Issued books by student", "Return request list", "Logout"]
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
        books_index
      when 4
        student_list
      when 5
        issued_books_list
      when 6
        puts "Return request list"
      when 7
        puts "\nLogout successfully\n"
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

  def books_index
    puts "\n---------- Details of Books ----------\n"
    print "\nId       Name of Book     Author\n"
    $books.each do |book|
      book.each do |key, value|
        print "#{value.to_s}          "
      end
      puts "\n"
    end
  end

  def show_book(id)
    puts "\nBook added successfully\n"
    $books.each do |book|
        book.each do |key, value|
          if(id == book[:id])
            puts "#{key.to_s}: #{value.to_s}"
          end
        end
    end
  end

  def issued_books_list
    puts "\n---------- Issued Books ----------\n"
    print "\nId       Name of Book     Author\n"
    $issued_books.each do |book|
      book.each do |key, value|
        print "#{value.to_s}          "
      end
      puts "\n"
    end
  end

  def student_list
    puts "\n---------- List of Students ----------\n"
    print "\nId       FirstName      Last Name      Email\n"
     Student.users.each do |book|
      book.each do |key, value|
        print "#{value.to_s}          "
      end
      puts "\n"
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
home = Home.new
home.get_choice




