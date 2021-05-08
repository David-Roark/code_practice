class Grep
  def self.grep(pattern, flags, files)
    patt = build_pattern(pattern, flags)
    num_line = flags.include?('-n')
    auto_name_file = files.size > 1

    result = ''

    if flags.include? '-l'
      files.each do |file_name|
        f = File.open(file_name, 'r')
        result << file_name + "\n" if patt =~ f.read
        f.close
      end

      return result.chomp
    end

    files.each do |file_name|
      f = File.open(file_name, 'r')

      if flags.include?('-v')
        f.each_line do |line|
          next if patt =~ line

          num = f.lineno.to_s + ':' if num_line
          f_name = file_name + ':' if auto_name_file
          result << "#{f_name}#{num}#{line}"
        end
      else
        f.each_line do |line|
          next unless patt =~ line

          num = f.lineno.to_s + ':' if num_line
          f_name = file_name + ':' if auto_name_file
          result << "#{f_name}#{num}#{line}"
        end
      end

      f.close
    end

    result.chomp
  end

  def self.build_pattern(pattern, flags)
    pattern = "^#{pattern}$" if flags.include? '-x'
    return Regexp.new(pattern, Regexp::IGNORECASE) if flags.include?('-i')

    Regexp.new(pattern)
  end
end
