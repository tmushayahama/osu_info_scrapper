# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
require 'nokogiri'
require 'open-uri'
require 'openssl'
require 'uri'

#the url for the OSU building list page
osu_buildings_url = "http://www.osu.edu/map/buildingindex.php"
osu_buildings_data = Nokogiri::HTML(open(osu_buildings_url))

# div class of ".div-col" contains only actresses names
building_list =  osu_buildings_data.css("#buildingIndex ol").css("li")
#puts building_list
#iterate through each actress and search the twitter page
#there is a class called .verified in the result html after a search
#the first is the one we want
#get the next element "span" which has a text of actress' twitter
building_list[27..-1].each do |building|
  building_number = building.at_css("a").next_element.text.strip.gsub(/[()]/, "")
  building_detail_url = "http://www.osu.edu/map/building.php?building="+building_number
  building_detail_data = Nokogiri::HTML(open(building_detail_url))
  building_info =  building_detail_data.css(".container .span-9")
  #this is where the actress name is from the Wikipedia
  #Buidings

  #puts building_address.at_css("p")
  building_address = building_info.at_css("p")
  #puts building_address
  building_info.css("ul").each do |c|

    building_description = c.at_css("li")
    puts building_description
  end
  building_address.search('br').each do |n|
    n.replace("`")
  end
  m = building_address.text.split("`")
puts m[3].strip
break
# puts building.at_css("a").text.strip+ " | " + building_number
end
