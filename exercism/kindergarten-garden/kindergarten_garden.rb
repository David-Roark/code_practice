class Garden
  STUDENTS = %i(alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry).freeze
  PLANTS = {'G' => :grass, 'C' => :clover, 'R' => :radishes, 'V' => :violets}.freeze

  def initialize(diagram, students = STUDENTS)
    @garden = diagram.split("\n").map(&:chars)
    @students = students.sort.map { |name| name.downcase.to_sym }
    students_garden
  end

  private
  def students_garden
    @students.each do |name|
      define_singleton_method(name) do
        i = @students.index(name)*2
        (@garden[0][i,2] + @garden[1][i,2]).map { |e| PLANTS[e]  }
      end
    end
  end

end
