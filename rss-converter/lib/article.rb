require 'resource'

class Article

  attr_reader :url
  attr_accessor :title, :description, :comment, :author, :datePublished, :articleBody, :articleSection, :language


  def initialize(url)
    @url = url
  end

  def uri
    @url
  end

  def to_resource
    Resource.new(uri, "Article")
      .add_property("headline", @title)
      .add_property("url", @url)
      .add_property("description", @description)
      .add_property("inLanguage", @language)
      .add_property("author", @author)
      .add_property("datePublished", @datePublished)
      .add_property("articleBody", @articleBody)
      .add_property("articleSection", @articleSection)
  end

end
