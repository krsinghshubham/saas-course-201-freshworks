# This process of recursive lookup is called "domain name resolution"
# Sample i/o:
######## $ ruby lookup.rb google.com
# google.com => 172.217.163.46
######## $ ruby lookup.rb gmail.com
# gmail.com => mail.google.com => google.com => 172.217.163.46
######## $ ruby lookup.rb gmil.com
# Error: record not found for gmil.com

def get_command_line_argument
  # ARGV is an array defined by Ruby which contains arguments while invoking the script from the command line.
  if ARGV.empty?
    puts "Usage: ruby lookup.rb <domain>"
    exit
  end
  ARGV.first
end

# `domain` contains the domain name we have to look up.
domain = get_command_line_argument
# File.readlines reads a file and returns an array of string, where each element is a line
dns_raw = File.readlines("zone.rb")

#parse function will hash the domains as key to their cateogry ip-address/parent-domain in dns_records
def parse_dns(dns_raw)
  dns_records = {}
  dns_raw.each do |record|
    recordArray = record.split(",").map(&:strip)
    dns_records[recordArray[1]] = []
    dns_records[recordArray[1]].push(recordArray[0])
    dns_records[recordArray[1]].push(recordArray[2])
  end
  dns_records #return statement in ruby
end

#resolve function will go to the parent domain or ip address.
def resolve(dns_records, lookup_chain, domain)
  if !dns_records.has_key? domain
    return lookup_chain
    elseif (dns_records[domain][0] == "A")
    return lookup_chain.push(dns_records[domain][1]) #returning lookup_chain here if belongs to A class
  else
    lookup_chain.push(dns_records[domain][1])
    resolve(dns_records, lookup_chain, dns_records[domain][1]) # pass the parent domain
  end
end

# To complete the assignment, implement `parse_dns` and `resolve` above since in Ruby you can invoke a function after it is defined.
dns_records = parse_dns(dns_raw)
lookup_chain = [domain]
lookup_chain = resolve(dns_records, lookup_chain, domain)
if lookup_chain.length == 1
  puts "error: record not found for #{domain}"
else
  puts lookup_chain.join(" => ")
end
