require 'minitest/autorun'
require 'csv'

class Student
  def self.all
    CSV.foreach "db.csv" do |row|
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

  def test_can_find_student_with_best_tests
    assert_equal __, Student.without_absences.count
  end

  def test_can_find_highest_scoring_student
    assert_equal __, Student.top_by_test_score.first_name
  end
end
