require 'mechanize'
agent = Mechanize.new
agent.get('http://3g.renren.com')
form = agent.page.forms.first
print "UserName, Email, Or PhoneNunber:"
email = gets
form.email = email
print "Password:"
password = gets
form.password = password
form.submit
agent.page.links[3]
agent.page.links[3].click
agent.get("http://3g.renren.com/gossip/wgetgossiplist.do?id=272290792&sid=vQVogCw2EovPbgNdPULm52&spf12b&htf=42")
p = []
1..1511.times do |i|
  #agent.page.links[28].click #Bug @ here
  agent.get("http://3g.renren.com/gossip/wgetgossiplist.do?curpage=#{i}&id=272290792&age=recent&sid=vQVogCw2EovPbgNdPULm52&sxlo51")
  line = agent.page.search("div").map(&:text).map(&:strip)
  p += line[5..14]
  print ">" if i%151 == 0
end
txt = File.open('Log.txt', 'w')
p.size()
p.each do |a|
  txt.write(a)
  txt.write("\n")
end
txt.close()

