require 'minitest/autorun'
require 'minitest/pride'

class Fixnum
  def happy_number?(possible_happy_numbers = [])
    return false if possible_happy_numbers.include? self

    possible_happy_numbers << self
    numbers = self.to_s.split('').map(&:to_i)
    result = numbers.map { |n| n*n }.reduce(:+)

    return true if result == 1
    result.happy_number? possible_happy_numbers
  end
end


class TestFixnum < Minitest::Test
  def test_happy_numbers
    assert 192.happy_number?
    assert 100.happy_number?
  end

  def test_unhappy_numbers
    refute 29.happy_number?
  end
end

