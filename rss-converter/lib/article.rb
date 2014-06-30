require 'resource'

class Article

  attr_reader :url
  attr_accessor :title, :description, :comment, :author, :datePublished, :articleBody, :articleSection, :language

  def initialize(url, options={})
    raise "url can't be nil" if url.nil?
    @url = url
    @title = options[:title]
    @description = options[:description]
    @language = options[:language]
    @author = options[:author]
    @datePublished  = options[:datePublished ]
    @articleBody = options[:articleBody]
    @articleSection = options[:articleSection]
  end
  
  alias_method :uri, :url

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
