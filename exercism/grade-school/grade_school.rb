class School
  def initialize
   @grades = Hash.new { |grades, grade| grades[grade] = [] }
  end

  def add(name, grade)
    @grades[grade] << name
  end

  def students(grade)
    @grades[grade].sort
  end

  def students_by_grade
    @grades.to_a.sort.map { |e|
      g = {}
      g[:grade] = e[0]
      g[:students] = e[1].sort

      g
    }
  end
end
