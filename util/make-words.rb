require 'unicode'

words = []
line = 0
File.foreach(ARGV[0]) do |l|
  line = line + 1
  orig = l
  l = Unicode::downcase l
  l.gsub!(/[^a-zæøå]/, ' ')
  l.strip!
  l.split.each do |w|
    if w == "ngden"
      STDERR.puts "#{line}: ngden: #{orig}"
    end
    words << w if w.length > 1
  end
end

puts words.uniq.sort.join "\n"
