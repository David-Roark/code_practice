class ResistorColorTrio
  COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"].freeze
  def initialize(colors)
    @colors = colors
  end

  def label
    raise ArgumentError unless @colors.all? { |c| COLORS.include? c }
    v = @colors[0...-1].inject('') { |s, c| s += COLORS.index(c).to_s }
    u = v.to_i * 10**COLORS.index(@colors[-1])

    u >= 1000 ? "Resistor value: #{u/1000} kiloohms" : "Resistor value: #{u} ohms"
  end
end
