require './book'
require './teacher'
require './student'
require './rental'
require 'json'
require 'fileutils'

# rubocop:disable Metrics
class App
  attr_accessor :people, :rentals, :books

  def initialize
    @rentals = []
    @books = []
    @people = []
    @people_path = './../file/people.json'
    @books_path = './../file/books.json'
    @rentals_path = './../file/rentals.json'
    files_path
  end

  def files_path
    FileUtils.mkdir_p('./../file') unless File.directory?('./../file')
    File.write(@people_path, []) unless File.exist?(@people_path)
    File.write(@books_path, []) unless File.exist?(@books_path)
    File.write(@rentals_path, []) unless File.exist?(@rentals_path)
    load_books
    load_people
    load_rentals
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

  def save_files
    people = []
    books = []
    rentals = []

    @people.each do |person|
      people << if person.is_a? Student
                  {
                    age: person.age,
                    name: person.name,
                    parent_permission: person.parent_permission
                  }
                else
                  person.is_a? Teacher
                  {
                    age: person.age,
                    name: person.name,
                    specializatin: person.specializatin
                  }
                end

      @books.each do |book|
        books << {
          title: book.title,
          author: book.author
        }
      end
      @rentals.each do |rental|
        rentals << {
          date: rental.date,
          person: rental.person.name,
          book: rental.book.title
        }
      end
    end

    File.write(@people_path, JSON.generate(people))
    File.write(@books_path, JSON.generate(books))
    File.write(@rentals_path, JSON.generate(rentals))
  end

  def load_people
    people = JSON.parse(File.read(@people_path))
    people.each do |person|
      @people <<
        if person['specialization']
          Teacher.new(person['specialization'], person['age'], person['name'])
        else
          Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
        end
    end
  end

  def load_books
    books = JSON.parse(File.read(@books_path))
    books.each do |book|
      @books <<
        Book.new(book['title'], book['author'])
    end
  end

  def load_rentals
    rentals = JSON.parse(File.read(@rentals_path))
    rentals.each do |rental|
      @rentals <<
        Rental.new(rental['date'], @people.select do |person|
                                     person.name == rental['person']
                                   end.first, @books.select do |book|
                                                book.title == rental['book']
                                              end.first)
    end
  end
end

# rubocop:enable Metrics
