require 'test_helper'
require 'base64'

class UchardetExtnTest < Minitest::Test
  def test_init
    refute_nil(ICU::UCharsetDetector)
    
    detector = ICU::UCharsetDetector.new
    refute_nil(detector)
  
    detector = ICU::UCharsetDetector.new(nil)
    refute_nil(detector)
  
    detector = ICU::UCharsetDetector.new('example text')
    refute_nil(detector)
    
    assert_raises(TypeError) do
      ICU::UCharsetDetector.new(0)
    end
    
    assert_raises(TypeError) do
      ICU::UCharsetDetector.new(Time.now)
    end
  end
  
  def test_detect
    detector = ICU::UCharsetDetector.new
    assert_raises(ICU::Error) do
      detector.detect
    end
    e = detector.detect('∂∆∂∆∂∆')
    assert(e.is_a? Hash)
    assert(e.has_key? :encoding)
    assert(e.has_key? :confidence)
    assert(e.has_key? :language)
    assert_equal('utf-8', e[:encoding].downcase)
    e = detector.detect('пример текста', 'utf-8')
    assert_equal('utf-8', e[:encoding].downcase)
    e = detector.detect('日本語日本語', 'Shift_JIS')
    assert_equal('utf-8', e[:encoding].downcase)
  end

  def test_detect_undetectable
    detector = ICU::UCharsetDetector.new
    e = detector.detect(Base64.decode64('AA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAAADkCtSFJT/nCPEwAAAAAAAA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAAADkCtSFJT/nCPEwAAAAAAAA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAAADkCtSFJT/nCPEwAAAAAAAA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAAADkCtSFJT/nCPEwAAAAAAAA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAA='))
    assert_equal(e, {encoding: '', confidence: 0, language: ''})
  end
  
  def test_detect_all
    detector = ICU::UCharsetDetector.new
    assert_raises(ICU::Error) do
      detector.detect_all
    end
    a = detector.detect_all('€‹€‹€')
    assert(a.is_a? Array)
    assert_equal(false, a.empty?)
    assert(a[0].is_a? Hash)
    assert(a[0].has_key? :encoding)
    assert(a[0].has_key? :confidence)
    assert(a[0].has_key? :language)
  end
  
  def test_detect_all_undetectable
    detector = ICU::UCharsetDetector.new
    e = detector.detect_all(Base64.decode64('AA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAAADkCtSFJT/nCPEwAAAAAAAA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAAADkCtSFJT/nCPEwAAAAAAAA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAAADkCtSFJT/nCPEwAAAAAAAA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAAADkCtSFJT/nCPEwAAAAAAAA5ArUhSU/5wjxMAAAAAAAAOQK1IUlP+cI8TAAAAAAA='))
    assert_empty(e)
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
    assert_nil(detector.text)
    detector = ICU::UCharsetDetector.new('blah')
    assert_equal('blah', detector.text)
    detector.text = 'test'
    assert_equal('test', detector.text)
    detector.detect
    assert_equal('test', detector.text)
  end
  
  def test_declared_encoding_accessor
    detector = ICU::UCharsetDetector.new
    assert_nil(detector.declared_encoding)
    detector.declared_encoding = 'iso-8859-15'
    assert_equal('iso-8859-15', detector.declared_encoding)
    detector.detect 'test'
    assert_equal('iso-8859-15', detector.declared_encoding)
  end
  
  def test_detectable_charsets
    detector = ICU::UCharsetDetector.new
    refute_nil(detector.detectable_charsets)
    assert(detector.detectable_charsets.is_a? Array)
  end
end