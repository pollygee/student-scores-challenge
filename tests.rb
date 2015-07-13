require 'minitest/autorun'
require 'csv'
require 'pry'

class Student
  attr_reader :id, :first_name, :absences, :quiz_average, :test_average
  def self.all
    CSV.foreach "db.csv" do |row|
      Student.new([r[0],r[1], r[2], r[3], r[4], r[5]])
    end
  end

  def initialize attributes
    @id, @first_name, @last_name, absences, quiz_average, test_average = attributes
    @absences = Integer(absences)
    @quiz = Float(quiz)
    @test = Flat(test)
  end

  def self.without_absences
    students = []
    CSV.foreach "db.csv" do |row|
      next if row.first == "Student Id"
      s = Student.new row
      if s.absences.to_i == 0
        result.push s
      end
      return result

    end
  end
end

class StudentTest < Minitest::Test
  def test_student_attributes
    s = Student.new([1, "Su", "Kim", 0, 99, 100])
    assert_equal 1, s.id
    assert_equal "Su", s.first_name
    assert_equal 100, s.test_average
  end

  def test_can_find_student_without_absences
    assert_equal 14, Student.without_absences.count
  end

  def test_can_find_highest_scoring_student
    assert_equal 0, Student.top_by_test_score.first_name
  end
end
