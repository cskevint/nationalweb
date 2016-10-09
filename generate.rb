require 'csv'

content_html = []


content_html << "<div class='container'>"

content_html << "<h1>Baha'i National Websites</h1>"

content_html << "<div class='row'>"
#content_html << "<div id='#gallery'>"

CSV.foreach('data/sites.csv') do |row|
  country = row.first
  url = row.last
  id = country.downcase.gsub(' ','_').gsub("'",'')
  thumb_filename = "thumbs/#{id}.gif"
  image_filename = "images/#{id}.png"

  image = "<img src='#{thumb_filename}' class='img-responsive' width=100 height=100 style='margin-left:auto;margin-right:auto'/>"

  link = "<a class='col-md-2 well' style='min-height:200px;background-color:#FCF8E3;' data-toggle='lightbox' data-gallery='sites' data-title='#{country}' data-url='#{url}' href='#{image_filename}'>"
  link += image
  link += "<div class='caption text-center'>#{country}</div>"
  link += "</a>"

  content_html << link

  thumb_filename = "thumbs/new/#{id}.gif"
  image_filename = "images/new/#{id}.png"

  image = "<img src='#{thumb_filename}' class='img-responsive' width=100 height=100 style='margin-left:auto;margin-right:auto'/>"

  link = "<a class='col-md-2 well' style='min-height:200px' data-toggle='lightbox' data-gallery='sites' data-title='#{country}' data-url='#{url}' href='#{image_filename}'>"
  link += image
  link += "<div class='caption text-center'>#{country}</div>"
  link += "</a>"

  content_html << link
end

#content_html << "</div>" ##gallery

content_html << "</div>" #.row

content_html << "</div>" #.container

f = File.open("template.html", "r").read

html = f.gsub("<%= content %>",content_html.join("\n"))

File.open("index.html", 'w').write(html)