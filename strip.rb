#!/usr/bin/env ruby

class Strip
  def self.extension(string)
    if is_fname_with_ext? string
      string.split('.')[0..-2].join('.')
    else
      string
    end
  end

  def self.is_fname_with_ext?(str)
    return false unless str.is_a? String
    str.match? /\.\w+\z/
  end

  attr_reader :input
  def initialize
    @input = ARGV.first
  end

  def output
    Strip.extension(input)
  end

  def print_output
    print output
  end
end

if __FILE__ == $0
  Strip.new.print_output
end
