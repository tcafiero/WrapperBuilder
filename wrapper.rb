require 'yaml'
require 'erubis'
descriptor = YAML.load_file('descriptor1.yml')

details="bla bla"
pr=File.read('pr.t')
out=File.open('wrapper.c','w')
eruby=Erubis::Eruby.new(pr)
out.puts eruby.result(binding())
system 'astyle.exe wrapper.c'


