#encoding: utf-8
b = File.open("OutPut.txt", "w")
a = File.open("RenrenExtractChat.txt", "r")
puts "想导出与谁的聊天纪录？"
user = gets
a.each_line do |line|
  if line =~ /###/	
    b.write(line.gsub(/悄悄话/, ""))
  end
end	
