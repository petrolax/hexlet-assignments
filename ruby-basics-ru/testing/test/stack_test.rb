# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  def setup
    @stack = Stack.new
  end

  def teardown
    @stack.clear!
  end

  # BEGIN

  def test_empty
    assert @stack.empty?
  end

  def test_push
    @stack.push! 4
    assert(@stack.to_a == [4])
  end

  def test_pop
    @stack.push! 1
    assert(@stack.to_a == [1])
    @stack.pop!
    assert(@stack.to_a == [])
  end

  def test_clear
    @stack.push! 1
    assert(@stack.to_a == [1])
    @stack.clear!
    assert(@stack.to_a == [])
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
