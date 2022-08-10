require './nameable'
class Person < Nameable
  attr_accessor :name, :age, :parent_permission
  attr_reader :id, :rentals

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  private

  def is_of_age? # rubocop:todo Naming/PredicateName
    @age >= 18
  end

  public

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
