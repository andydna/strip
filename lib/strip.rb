#!/usr/bin/env ruby
require 'pry'

class Strip
  def self.extension(string)
    binding.pry
    if is_fname_with_ext? string
      string.split('.')[0..-2].join('.')
    else
      string
    end
  end

  def self.is_fname_with_ext?(str)
    binding.pry
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

unless $andydna_testing
  Strip.new.print_output
end
