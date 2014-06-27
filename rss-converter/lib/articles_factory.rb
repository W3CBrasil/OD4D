require 'article'

class ArticlesFactory
  def create(rss)
    rss.items.map do |item|
      article = Article.new(item.link)
      article.title = item.title
      article
    end
  end
end
