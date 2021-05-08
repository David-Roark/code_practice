class Say
  @@BASE = %w(zero one two three four five six seven eight nine).freeze
  @@BASE_10 = %w(ten twenty thirty forty fifty sixty seventy eighty ninety).freeze

  def initialize(n)
    @n = n
  end

  def in_english
    begin
      raise ArgumentError if @n < 0 || @n >= 1_000_000_000_000
    end
    result = ''

    result += case @n
              when 0..9
                @@BASE[@n]
              when 10..19
                if @n < 12
                  %w(ten eleven twelve)[@n%10]
                elsif @n == 15
                  'fifteen'
                else
                  (@@BASE[@n%10] + 'teen')
                end
              when 20..99
                @@BASE_10[@n/10 - 1] + '-' + Say.new(@n%10).in_english
              when 100..999
                @@BASE[@n/100] + ' hundred ' + Say.new(@n%100).in_english
              when 1_000..999_999
                Say.new(@n/1_000).in_english + ' thousand ' + Say.new(@n%1_000).in_english
              when 1_000_000..999_999_999
                Say.new(@n/1_000_000).in_english + ' million ' + Say.new(@n%1_000_000).in_english
              when 1_000_000_000..999_999_999_999
                Say.new(@n/1_000_000_000).in_english + ' billion ' + Say.new(@n%1_000_000_000).in_english
              end

    result.gsub('tt', 't')
          .gsub(/(-| )zero/, '')
  end
end
