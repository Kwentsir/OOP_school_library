require "./book"
require "./teacher"
require "./student"
require "./rental"

class App
  def initialize
    @rentals = []
    @books = []
    @people = []
  end
end