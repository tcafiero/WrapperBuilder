require 'yaml'
require 'erubis'
require 'xmlsimple'
require 'vine'

#interface = YAML.load_file(ARGV[0]+'.yml')
xs = XmlSimple.new({ 'ForceArray' => true, 'KeepRoot' => true })
xmlfile = File.open(ARGV[0]+'.xml','r')
interface = xs.xml_in(xmlfile)
# xmlfile=File.open(ARGV[0]+'.xml','w')
# xmlfile.puts XmlSimple.xml_out(interface)
descriptor=interface["Interface"][0]
for input in descriptor["Input"]
  for signal in input["NBC"] || input["Proxy"] || input["Pin"] || input["Network"]
    input["Implemented"]=true
    if signal.has_key?("Implemented") && (signal["Implemented"]=='false' || signal["Implemented"]=='0')
      input["Implemented"]=false
    end
    for value in input["Value"]
      if input.has_key?("NBC")
        s = value[0].clone
        if s.include? '&'
          s = s.delete! '&'
          value[0] = (signal["VF"]).upcase+'_'+(input["Name"]).upcase+'_'+s.upcase
        else
          value[0] =   s
        end
      end
      if input.has_key?("Proxy")
        s = value[0].clone
        if s.include? '&'
          s = s.delete! '&'
          value[0] =  'VERS_'+(input["Name"]).upcase+'_'+s.upcase
        else
          value[0] =   s
        end
      end
      if input.has_key?("Network") || input.has_key?("Pin") || input.has_key?("Diagnosis")
        s = value[0].clone
        if s.include? '&'
          s = s.delete! '&'
          value[0] =  (descriptor["Module"]).upcase+'_'+(input["Name"]).upcase+'_'+s.upcase
        else
          value[0] =   s
        end
      end
    end
  end
end

for output in descriptor["Output"]
  for signal in output["NBC"] || output["Pin"] || output["Network"]
    for value in output["Value"]
      s = value[0].clone
      if s.include? '&'
        s = s.delete! '&'
        value[0] =  (descriptor["Module"]).upcase+'_'+(output["Name"]).upcase+'_'+s.upcase
      else
        value[0] =   s
      end
    end
  end
end

if descriptor.has_key?("Timer")
  for timer in descriptor["Timer"]
    for value in timer["Value"]
      s = value[0].clone
      if s.include? '&'
        s = s.delete! '&'
        value[0] =  (descriptor["Module"]).upcase+'_TIMER'+(timer["Name"]).upcase+'_'+s.upcase+'_TIMEOUT'
      else
        value[0] =   s
      end
    end
  end
end
if ARGV[1] == '-print'
  puts interface.to_yaml
  exit
end

if true
  pr=File.read('wrapper_c.template')
  out=File.open(ARGV[0]+'.c','w')
  eruby=Erubis::Eruby.new(pr)
  out.puts eruby.result(binding())
  out.close();
  system 'astyle.exe -n '+ARGV[0]+'.c'
end

if true
  pr=File.read('wrapper_config_h.template')
  out=File.open(ARGV[0]+'_config.h','w')
  eruby=Erubis::Eruby.new(pr)
  out.puts eruby.result(binding())
  out.close();
  system 'astyle.exe -n '+ARGV[0]+'_config.h'
end

if true
  pr=File.read('wrapper_h.template')
  out=File.open(ARGV[0]+'.h','w')
  eruby=Erubis::Eruby.new(pr)
  out.puts eruby.result(binding())
  out.close();
  system 'astyle.exe -n '+ARGV[0]+'.h'
end

if true
  pr=File.read('external_link_c.template')
  out=File.open('external_link.c','w')
  eruby=Erubis::Eruby.new(pr)
  out.puts eruby.result(binding())
  out.close();
  system 'astyle.exe -n external_link.c'
end

if true
  pr=File.read('external_link_h.template')
  out=File.open('external_link.h','w')
  eruby=Erubis::Eruby.new(pr)
  out.puts eruby.result(binding())
  out.close();
  system 'astyle.exe -n external_link.h'
end

if true
  pr=File.read('SWCC_Input_csv.template')
  out=File.open(ARGV[0]+'_SVCC_Input.csv','w')
  eruby=Erubis::Eruby.new(pr)
  out.puts eruby.result(binding())
  out.close();
end

if true
  pr=File.read('SWCC_Output_csv.template')
  out=File.open(ARGV[0]+'_SVCC_Output.csv','w')
  eruby=Erubis::Eruby.new(pr)
  out.puts eruby.result(binding())
  out.close();
end
