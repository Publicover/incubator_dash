require 'minitest/autorun'
# require 'miitest/pride'
require './ruby_scratch'

class RubyScratchTest < Minitest::Test

  description = "Think of a brand. Any one. It can be something you like, something new, something old, whatever you'd like."

  def test_description_is_valid
    description = "Think of a brand. Any one. It can be something you like, something new, something old, whatever you'd like."
    assert_equal description, "Think of a brand. Any one. It can be something you like, something new, something old, whatever you'd like."
  end

end
