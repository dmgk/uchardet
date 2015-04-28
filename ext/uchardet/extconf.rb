require 'mkmf'

icu_config = `which icu-config`.strip
if icu_config.empty?
  abort "ICU seems to be missing. Try 'port install icu' or 'apt-get install libicu-dev'"
end

$LIBS << ' ' + `#{icu_config} --ldflags-system`.strip
$LIBS << ' ' + `#{icu_config} --ldflags-libsonly`.strip
$LDFLAGS << ' ' + `#{icu_config} --ldflags-searchpath`.strip

create_makefile('uchardet')
