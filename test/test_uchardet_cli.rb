require File.join(File.dirname(__FILE__), 'test_helper.rb')
require 'uchardet/cli'

class TestUchardetCli < Test::Unit::TestCase
  def setup
    Uchardet::CLI.execute(@stdout_io = StringIO.new, [])
    @stdout_io.rewind
    @stdout = @stdout_io.read
  end

  def test_print_default_output
    assert_match(/Usage: .* \[options\] file/, @stdout)
  end
end
