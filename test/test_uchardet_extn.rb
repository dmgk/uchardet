# encoding: utf-8

require 'test/unit'

$LOAD_PATH.unshift File.dirname(__FILE__) + '/../ext/uchardet'
require 'uchardet.so'

class TestUchardetExtn < Test::Unit::TestCase   # :nodoc:
  def test_init
    assert_not_nil(ICU::UCharsetDetector)

    assert_nothing_raised do
      detector = ICU::UCharsetDetector.new
      assert_not_nil(detector)

      detector = ICU::UCharsetDetector.new nil
      assert_not_nil(detector)

      detector = ICU::UCharsetDetector.new 'some text'
      assert_not_nil(detector)
    end

    assert_raise(TypeError) do
      detector = ICU::UCharsetDetector.new 0
    end

    assert_raise(TypeError) do
      detector = ICU::UCharsetDetector.new Time.now
    end
  end

  def test_detect
    detector = ICU::UCharsetDetector.new
    assert_raise(ICU::Error) do
      detector.detect
    end
    e = detector.detect '∂∆∂∆∂∆'
    assert(e.is_a? Hash)
    assert(e.key? :encoding)
    assert(e.key? :confidence)
    assert(e.key? :language)
    assert_equal('utf-8', e[:encoding].downcase)
    e = detector.detect '··', 'utf-8'
    assert_equal('utf-8', e[:encoding].downcase)
    e = detector.detect '··', 'Shift_JIS'
    assert_equal('utf-8', e[:encoding].downcase)
  end

  def test_detect_all
    detector = ICU::UCharsetDetector.new
    assert_raise(ICU::Error) do
      detector.detect_all
    end
    a = detector.detect_all '€‹€‹€'
    assert(a.is_a? Array)
    assert_equal(false, a.empty?)
    assert(a[0].is_a? Hash)
    assert(a[0].key? :encoding)
    assert(a[0].key? :confidence)
    assert(a[0].key? :language)
  end

  def test_input_filtered_accessor
    detector = ICU::UCharsetDetector.new
    assert_equal(false, detector.input_filtered?)
    detector.input_filtered = true
    assert_equal(true, detector.input_filtered?)
    detector.input_filtered = ''
    assert_equal(true, detector.input_filtered?)
    detector.input_filtered = nil
    assert_equal(false, detector.input_filtered?)
  end

  def test_text_accessor
    detector = ICU::UCharsetDetector.new
    assert_equal(nil, detector.text)
    detector = ICU::UCharsetDetector.new 'blah'
    assert_equal('blah', detector.text)
    detector.text = 'test'
    assert_equal('test', detector.text)
    detector.detect
    assert_equal('test', detector.text)
  end

  def test_declared_encoding_accessor
    detector = ICU::UCharsetDetector.new
    assert_equal(nil, detector.declared_encoding)
    detector.declared_encoding = 'iso-8859-15'
    assert_equal('iso-8859-15', detector.declared_encoding)
    detector.detect 'test'
    assert_equal('iso-8859-15', detector.declared_encoding)
  end

  def test_detectable_charsets
    detector = ICU::UCharsetDetector.new
    assert_not_nil(detector.detectable_charsets)
    assert(detector.detectable_charsets.is_a? Array)
  end
end
