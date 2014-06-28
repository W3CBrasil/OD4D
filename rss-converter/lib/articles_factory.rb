require 'article'

class ArticlesFactory
  def create(rss)
    rss.items.map do |item|
      article = Article.new(get_item_prop(item.link))
      article.title = get_item_prop(item.title)
      article.description = get_item_prop(item.description)
      article.datePublished = item.pubDate
      article.author = get_item_prop(item.dc_creator)
      article.articleBody = get_item_prop(item.content_encoded)
      article.articleSection = item.category
      article.language = get_item_prop(item.dc_language)
      article
    end
  end

  def get_item_prop(prop)
    if (prop != nil) then
        prop = prop.strip
    end
    prop
  end

end

