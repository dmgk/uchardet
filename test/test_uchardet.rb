# encoding: utf-8

require File.dirname(__FILE__) + '/test_helper.rb'

class TestUchardet < Test::Unit::TestCase   # :nodoc:
  def test_detect
    detector = ICU::UCharsetDetector.new
    assert_equal(detector.detect(''), ICU::UCharsetDetector.detect(''))
  end

  def test_detect_all
    detector = ICU::UCharsetDetector.new
    assert_equal(detector.detect_all('∑'), ICU::UCharsetDetector.detect_all('∑'))
  end

  def test_detectable_charsets
    detector = ICU::UCharsetDetector.new
    assert_equal(detector.detectable_charsets, ICU::UCharsetDetector.detectable_charsets)
  end
end
