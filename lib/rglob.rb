# Glob-syntax pattern matching library
#
# Example:
#   g = RGlob::Glob.new('a/b*.rb')
#   g.match('a/b.rb') # returns true
#   g.match('a/c.rb') # returns false
#
# The patterns hold the exact same meaning as in Dir.glob, but this library
# does not rely upon the filesystem. Glob objects have the exact same
# interface as Regexp.

module RGlob
  class Glob
    attr_reader :pattern, :regexp

    def initialize(pattern)
      if pattern.is_a?(Regexp)
        @pattern = nil
        @regexp = pattern
      else
        @pattern = pattern
        @regexp = RGlob::pattern_to_regexp(pattern)
      end
    end

    def &(other)
      Glob.new(regexp & other.regexp)
    end

    def ==(other)
      if other.is_a?(Glob)
        other = other.regexp
      end

      regexp == other
    end
    alias_method :eql?, :==

    def ===(str)
      regexp === str
    end

    def casefold?
      false
    end

    def hash
      regexp.hash
    end

    def kcode
      regexp.kcode
    end

    def match(str)
      regexp.match(str)
    end

    def options
      0
    end

    def source
      pattern || regexp.source
    end

    def to_s
      pattern || regexp.to_s
    end

    class << self
      def compile(pattern)
        Glob.new(pattern)
      end

      def escape(str)
        raise NotImplementedError.new
      end
      alias_method :quote, :escape

      def last_match(*args)
        raise NotImplementedError.new
      end

      def union(*patterns)
        raise NotImplementedError.new
      end
    end
  end

  def self.pattern_to_regexp(pattern)
    s = Regexp.escape(pattern)
    PatternReplacements.each do |from, to|
      s.gsub!(from, to)
    end
    return Regexp.new("^#{s}$")
  end

  private

  PatternReplacements = [
    [ '\\*\\*', '.*' ],
    [ '\\*', '[^/]*'],
    [ '\\?', '[^/]' ],
  ]
end
