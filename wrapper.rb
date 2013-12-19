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

pr=File.read('wrapper_config_h.template')
out=File.open(ARGV[0]+'_config.h','w')
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
out.close();
system 'astyle.exe '+ARGV[0]+'_config.h'


descriptor["MIL"]=false
pr=File.read('wrapper_h.template')
out=File.open(ARGV[0]+'.h','w')
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
out.close();
system 'astyle.exe '+ARGV[0]+'.h'

pr=File.read('external_link_c.template')
out=File.open('external_link.c','w')
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
out.close();
system 'astyle.exe external_link.c'


descriptor["MIL"]=true
pr=File.read('wrapper_h.template')
out=File.open('external_link.h','w')
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
out.close();
system 'astyle.exe external_link.h'

pr=File.read('SWCC_csv.template')
out=File.open(ARGV[0]+'_SVCC.csv','w')
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
out.close();

