require 'article'
require 'articles_factory'
require 'resource'
require 'turtle'
require 'rss'

class RSSToTurtle
  def self.convert(rss_str)
    raise "rss can't be nil or empty" if rss_str.nil? || rss_str.empty?

    rss = RSS::Parser.parse(rss_str)
    articleFactory = ArticlesFactory.new
    articles = articleFactory.create(rss)

    turtle_prefixes = {
        rdf: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
        schema: 'http://schema.org/'
    }
    turtle = Turtle.new(turtle_prefixes)
    articles.each do |article|
      turtle.add_resource(article.to_resource)
    end

    turtle.to_s
  end
end
