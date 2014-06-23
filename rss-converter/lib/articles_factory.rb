require 'article'

class ArticlesFactory

  def create(rss)
    rss.items.map do |item|
      Article.new(item.title,item.link)
    end
  end

end
