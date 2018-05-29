require 'mkmf'

icu_config = `which icu-config`.strip
if icu_config.empty?
  abort %q{Could not find ICU libraries and/or development tools. Try installing "icu-devtools" or "icu" package.}
end

$LIBS << ' ' + `#{icu_config} --ldflags-system`.chomp
$LIBS << ' ' + `#{icu_config} --ldflags-libsonly`.chomp
$LDFLAGS << ' ' + `#{icu_config} --ldflags-searchpath`.chomp

create_makefile('uchardet_ext')
