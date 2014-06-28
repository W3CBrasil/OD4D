require 'rss'
require 'open-uri'

url = 'http://webfoundation.org/feed/'
open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "Title: #{feed.channel.title}"
    feed.items.each do |item|
        puts "Item: #{item.title}"
    end
    puts feed.items[0].inspect
end

