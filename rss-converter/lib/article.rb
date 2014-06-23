require 'resource'

class Article

  attr_reader :title, :link

  def initialize(title, link)
    @title = title
    @link = link
  end

  def uri
    @link
  end

  def to_resource
    Resource.new(uri, "schema:Article")
      .add_property("title", title)
      .add_property("link", link)
  end

end
