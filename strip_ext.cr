class Strip
  @input : String

  def self.extension(string)
    if is_fname_with_ext? string
      string.split('.')[0..-2].join('.')
    else
      string
    end
  end

  def self.is_fname_with_ext?(str)
    return false unless str.is_a? String
    str =~ /\.\w+\z/
  end

  getter :input
  def initialize
    if ARGV.size > 0
      @input = ARGV.first
    else
      @input = ""
    end
  end

  def output
    Strip.extension(input)
  end

  def print_output
    print output
  end
end

Strip.new.print_output
