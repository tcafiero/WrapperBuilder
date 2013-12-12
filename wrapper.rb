require 'yaml'
require 'erubis'
require 'xmlsimple'
descriptor = YAML.load_file(ARGV[0]+'.yml')
xmlfile=File.open(ARGV[0]+'.xml','w')
xmlfile.puts XmlSimple.xml_out(descriptor)

pr=File.read('wrapper_c.template')
out=File.open(ARGV[0]+'.c','w')
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
out.close();
system 'astyle.exe '+ARGV[0]+'.c'

pr=File.read('wrapper_h.template')
if descriptor["MIL"]
out=File.open('external_link.h','w')
else
out=File.open(ARGV[0]+'.h','w')
end
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
out.close();
if descriptor["MIL"]
system 'astyle.exe external_link.h'
else
system 'astyle.exe '+ARGV[0]+'.h'
end


