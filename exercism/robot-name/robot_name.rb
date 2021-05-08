class Robot
  @@AP = [*'A'..'Z']
  @@all_names = []

  attr_reader :name

  def initialize()
    begin
      name = Robot.create_name
    end while Robot.exist?(name)

    @@all_names << name
    @name = name
  end

  def self.forget
    @@all_names.clear
  end

  def reset
    begin
      name = Robot.create_name
    end while Robot.exist?(name)

    @@all_names << name
    @name = name
  end

  private

  def self.create_name
    @@AP.sample + @@AP.sample + '%03d' %[rand(999)]
  end

  def self.exist?(name)
    @@all_names.include?(name)
  end

end
