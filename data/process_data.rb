require 'csv'

if ARGV.first == 'screenshots'

  CSV.foreach('sites.csv') do |row|
    country = row.first
    url = row.last
    filename = "../images/#{country.downcase.gsub(' ','_').gsub("'",'')}.png"
    cmd = "phantomjs rasterize.js #{url} #{filename} \"1024px*1024px\""
    puts cmd
    `#{cmd}`
  end

elsif ARGV.first == 'list'

  CSV.foreach('sites.csv') do |row|
    country = row.first.downcase.gsub(' ','_').gsub("'",'')
    url = row.last
    puts "#{country} --> #{url}"
  end

elsif ARGV.first == 'check_images'

  CSV.foreach('sites.csv') do |row|
    country = row.first
    url = row.last
    filename = "../images/#{country.downcase.gsub(' ','_').gsub("'",'')}.png"
    cmd = "phantomjs rasterize.js #{url} #{filename} \"1024px*1024px\""
    puts "NOT FOUND: #{country} --> #{cmd}" if not File.exists?(filename)
  end

else

  puts "COMMAND NOT FOUND"

end
