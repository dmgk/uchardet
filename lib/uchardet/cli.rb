require 'optparse'

module Uchardet
  class CLI
    def self.execute(stdout, args = [])
      @stdout = stdout
      @options = {
        input_filtered: false,
        declared_encoding: nil,
        detect_all: false,
        path: nil
      }

      parser = OptionParser.new do |opts|
        opts.banner = <<-BANNER.gsub(/^\s*/, '')
          Usage: #{File.basename($PROGRAM_NAME)} [options] file
        BANNER

        opts.on('-l', '--list',
                'Display list of detectable character sets.'
               ) { list; exit }
        opts.on('-s', '--strip',
                'Strip HTML or XML markup before detection.'
               ) { @options[:input_filtered] = true }
        opts.on('-e', '--encoding',
                'Hint the charset detector about possible encoding.'
               ) { |arg| @options[:declared_encoding] = arg }
        opts.on('-a', '--all',
                'Show all matching encodings.'
               ) { @options[:detect_all] = true }
        opts.on('-h', '--help',
                'Show this help message.'
               ) { @stdout.puts opts; exit }

        if args.empty?
          @stdout.puts opts
        else
          begin
            opts.parse!(args)
          rescue OptionParser::ParseError => ex
            STDERR.puts "ERROR: #{ex}. See #{File.basename($PROGRAM_NAME)} --help"
            exit
          end

          @options[:path] = args.last
          if @options[:path].nil? || @options[:path].empty?
            STDERR.puts 'ERROR: please specify a file path.'
            exit
          end

          detect
        end
      end
    end

    def self.list
      ICU::UCharsetDetector.detectable_charsets.uniq.sort.each { |name| @stdout.puts name }
    end

    def self.detect
      detector = ICU::UCharsetDetector.new
      detector.input_filtered = @options[:input_filtered]
      detector.declared_encoding = @options[:declared_encoding]

      source = IO.read(@options[:path])
      matches = if @options[:detect_all]
                  detector.detect_all(source)
                else
                  [detector.detect(source)]
      end

      matches.each do |match|
        @stdout.puts "#{match[:encoding]} (confidence #{match[:confidence]}%)"
      end
    rescue Exception => ex
      STDERR.puts "ERROR: #{ex}"
    end
  end
end
