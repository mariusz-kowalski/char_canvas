require 'minitest/autorun'
require_relative '../lib/char_canvas.rb'

class TestCharCanvas < Minitest::Test
  def setup
    @canvas = CharCanvas.new
  end

  def test_print
    @canvas.insert 'a', 1, 1
    @canvas.insert 'bb', 3
    @canvas.insert 'c', 3, 3

    result = mock_stdout { @canvas.paint }

    needed = <<EOT

 a

bb c
EOT
    assert_equal needed, result
  end

  private

  def mock_stdout
    origin_stdout = $stdout
    $stdout = StringIO.new '', 'w'
    yield
    ensure
      fake_out = $stdout
      $stdout = origin_stdout
      return fake_out.string
  end
end
