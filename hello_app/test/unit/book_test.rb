require File.dirname(__FILE__) + '/../test_helper'

class BookTest < Test::Unit::TestCase
  fixtures :books

  # Replace this with your real tests.
  def test_truth
    assert_kind_of Book, books(:first)
  end
end
