class School
  def initialize
    @students = []
  end

  def add(student, grade)
    @students << [student, grade]
  end

  def to_h
    hash = {}

    @students.each do |student|
      if hash.key?(student[1])
        hash[student[1]] += [student[0]]
      else
        hash[student[1]] = [student[0]]
      end
    end

    hash.each_value(&:sort!).sort_by { |k, _| k }.to_h
  end

  def grade(grade)
    return [] if !to_h.key?(grade)
    to_h[grade]
  end
end
