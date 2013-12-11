require 'yaml'
require 'erubis'
descriptor = YAML.load_file(ARGV[0]+'.yml')

details="bla bla"
pr=File.read('wrapper_c.template')
out=File.open(ARGV[0]+'.c','w')
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
out.close();
system 'astyle.exe '+ARGV[0]+'.c'


