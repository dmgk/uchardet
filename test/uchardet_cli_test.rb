require "test_helper"
require 'uchardet/cli'
require 'stringio'

class UchardetCliTest < Minitest::Test
  def setup
    Uchardet::CLI.execute(@stdout_io = StringIO.new, [])
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end
  
  def test_print_default_output
    assert_match(/Usage: .* \[options\] file/, @stdout)
  end
end