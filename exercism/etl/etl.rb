class ETL
  def self.transform(old)
    new_h = {}
    old.keys.each { |e|
      old[e].each { |c| new_h[c.downcase] = e }
    }

    new_h
  end
end
