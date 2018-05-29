require 'uchardet_ext'
require 'uchardet/version'

module ICU  # :main: README
  class UCharsetDetector  # :main: README
    # Shortcut for ICU::UCharsetDetector#detect
    def self.detect(*args)
      self.new.detect(*args)
    end
    
    # Shortcut for ICU::UCharsetDetector#detect_all
    def self.detect_all(*args)
      self.new.detect_all(*args)
    end
    
    # Shortcut for ICU::UCharsetDetector#detectable_charsets
    def self.detectable_charsets
      self.new.detectable_charsets
    end
  end
end
