require "csv"
require "faker"
require "rubystats"

N_STUDENTS = rand 50 .. 100

HEADERS = [
  "Student Id",
  "First Name",
  "Last Name",
  "Absences",
  "Quiz Avg",
  "Test Avg"
]

DISTRIBUTION = Rubystats::NormalDistribution.new(80, 8)

CSV.open "db.csv", "w" do |csv|
  # Header row
  csv << HEADERS

  # Data rows
  N_STUDENTS.times do
    csv << [
      rand(1_000_000 .. 10_000_000),
      Faker::Name.first_name,
      Faker::Name.last_name,
      rand(0..3),
      DISTRIBUTION.rng.round(2),
      DISTRIBUTION.rng.round(2)
    ]
  end
end
