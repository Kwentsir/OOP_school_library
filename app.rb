require './book'
require './teacher'
require './student'
require './rental'

class App
  def initialize
    @rentals = []
    @books = []
    @people = []
  end

  def create_student(age, name, parent_permission)
    student = Student.new(age, name, parent_permission: parent_permission)
    @people.push(student)
  end

  def create_teacher(specialization, age, name)
    teacher = Teacher.new(specialization, age, name)
    @people.push(teacher)
  end

  def add_book(title, author)
    book = Book.new(title, author)
    @books.push(book)
  end

  def add_rental(book, person, date)
    rental = Rental.new(date, person, book)
    @rentals.push(rental)
  end

  def list_rentals(person_id)
    person_rentals = @rentals.select { |rental| rental.person.id == person_id }
    if person_rentals.length.positive?
      person_rentals.each do |rental|
        puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
      end
    else
      puts 'The selected person has no rentals'
    end
  end

  def list_people
    if @people.length.positive?
      @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    else
      puts 'Enter details of person!'
    end
  end

  def list_books
    if @books.length.positive?
      @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    else
      puts 'You have no books added!'
    end
end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Enter numeber]: '
    person_option = gets.chomp.to_i
    if [1, 2].include?(person_option)
      print 'Enter age'
      age = gets.chomp
      print 'Enter name'
      name = gets.chomp
      if person_option == 1
        print 'Has Parent permission? [Y/N]:'
        permit = gets.chomp
        permission = permit.downcase == 'y'
        create_student(age, name, permission)
      else
        print 'Enter specializatin:'
        specializatin = gets.chomp
        create_teacher(specializatin, age, name)
      end
      puts 'Person created successfully'
    else
        puts 'Invalid option'
        create_person
    end
end

  def create_book
    print 'Enter title'
    title = gets.chomp
    print 'Enter author:'
    author = gets.chomp
    add_book(title, author)
    puts 'Books created successfully'
  end

  def create_rental
    if @books.length.positive? && @people.length.positive?
        puts 'Select a book from the following list by number'
        @books.each_with_index { |book, index| puts "#{index} Title: \"#{book.title}\", Author: #{book.author}" }
        book_id = gets.chomp.to_i
        puts 'Select a person from the following list by number'
        @people.each_with_index do |person, index| puts "#{index} [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        person_id = gets.chomp.to_i
        print 'Enter the date in this format YYYY/MM/DD:'
        date = gets.chomp
        add_rental(@books[book_id], @people[person_id], date)
        puts 'Rental created successfully'
    else
        puts 'Please add a book and/or a person before creating a rental'
    end
end
  
def rentals_per_person
  if @rentals.length.positive?
    print 'Enter id of the person you want rentals for:'
    person_id = gets.chomp.to_i
    list_rentals(person_id)
  else
    puts 'Rentals is empty!'
  end
end

  def run_program
    puts 'Enjoy the School Library App!'
    display_actions
  end

  def display_actions
    
end
