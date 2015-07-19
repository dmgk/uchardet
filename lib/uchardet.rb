$LOAD_PATH.unshift(File.dirname(__FILE__)) unless
  $LOAD_PATH.include?(File.dirname(__FILE__)) || $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))

module Uchardet
  VERSION = '0.1.3'
end

begin
  require 'uchardet.so'
rescue LoadError
  # uh-oh
end

module ICU  # :main: README
  class UCharsetDetector  # :main: README
    ##
    # Shortcut for ICU::UCharsetDetector#detect
    #
    def self.detect(*args)
      new.detect(*args)
    end

    ##
    # Shortcut for ICU::UCharsetDetector#detect_all
    #
    def self.detect_all(*args)
      new.detect_all(*args)
    end

    ##
    # Shortcut for ICU::UCharsetDetector#detectable_charsets
    #
    def self.detectable_charsets
      new.detectable_charsets
    end
  end
end
