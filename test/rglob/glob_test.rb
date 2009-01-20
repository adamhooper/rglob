require 'test/unit'
require File.dirname(__FILE__) + '/../../lib/rglob'

class RGlob::GlobTest < Test::Unit::TestCase
  def self.define_simple_test(pattern, query, should_match, description)
    define_method("test_#{description}".to_sym) do
      glob = RGlob::Glob.new(pattern)
      assert_equal(should_match, !!glob.match(query), description)
    end
  end

  define_simple_test('a', 'a', true, 'normal pattern matching')
  define_simple_test('a', 'b', false, 'normal pattern not matching')
  define_simple_test('a', 'aa', false, 'normal pattern not matching substring')
  define_simple_test('a?', 'ab', true, '? matching')
  define_simple_test('a?', 'a-', true, '? matching symbol')
  define_simple_test('a?', 'abc', false, '? not matching longer string')
  define_simple_test('a?', 'a/', false, '? not matching /')
  define_simple_test('a*', 'abcd', true, '* matching end of string')
  define_simple_test('*a', 'abcda', true, '* matching beginning of string')
  define_simple_test('a*a', 'abcda', true, '* matching middle of string')
  define_simple_test('*a*', 'bbbabb', true, '* matching in two places')
  define_simple_test('a*b', 'ab', true, '* matching nothing')
  define_simple_test('a*b', 'aa', false, '* not matching')
  define_simple_test('a*b', 'a/b', false, '* not matching /')
  define_simple_test('a**b', 'a/b', true, '** matching /')
end
