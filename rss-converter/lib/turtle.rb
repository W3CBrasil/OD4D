require 'rdf'
require 'rdf/turtle'

class Turtle
  def initialize(prefixes = {})
    @prefixes = prefixes
    @resources = []
  end

  def add_resource(resource)
    @resources.push(resource)
    self
  end

  def to_string
    graph = RDF::Graph.new

    @resources.each do |resource|
        resourceUri = RDF::URI.new(resource.uri)
        graph << [resourceUri, RDF.type, RDF::SCHEMA.Article]
        graph << [resourceUri, RDF::SCHEMA.headline, resource.properties["schema:headline"]]
        if (resource.properties["schema:url"] != nil)
            graph << [resourceUri, RDF::SCHEMA.url, RDF::URI.new(resource.properties["schema:url"])]
        end
        if (resource.properties["schema:articleSection"] != nil)
          graph << [resourceUri, RDF::SCHEMA.articleSection, resource.properties["schema:articleSection"]]
        end
        if (resource.properties["schema:datePublished"] != nil)
          graph << [resourceUri, RDF::SCHEMA.datePublished, resource.properties["schema:datePublished"]]
        end
        if (resource.properties["schema:author"] != nil)
          graph << [resourceUri, RDF::SCHEMA.author, resource.properties["schema:author"]]
        end
    end

    RDF::Turtle::Writer.buffer(prefixes: @prefixes) do |writer|
        graph.each_statement do |statement|
            writer << statement
        end
    end
  end

end
