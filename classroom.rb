class Classroom
  attr_reader :students
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student: Student)
    @student.push(student)
    @student.classroom = self
  end
end
