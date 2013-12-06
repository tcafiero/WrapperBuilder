require 'yaml'
require 'erubis'
descriptor = YAML.load_file('descriptor1.yml')

details="bla bla"
pr=File.read('pr.t')
eruby=Erubis::Eruby.new(pr)
puts eruby.result(binding())
