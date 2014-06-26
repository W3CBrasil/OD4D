require 'uri'
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
    graph = create_graph_from_resource

    RDF::Turtle::Writer.buffer(prefixes: @prefixes) do |writer|
        graph.each_statement do |statement|
            writer << statement
        end
    end
  end

  def create_graph_from_resource
    graph = RDF::Graph.new

    @resources.each do |resource|
        resourceUri = RDF::URI.new(resource.uri)
        graph << [resourceUri, RDF.type, RDF::SCHEMA.Article]

        resource.properties.each do |key, object |
          add_triple_to_graph(graph, resourceUri, key, object)
        end
    end
    graph
  end

  def add_triple_to_graph(graph, resourceUri, key, object)
    predicate = RDF::SCHEMA.send(key)
    if object =~ /\A#{URI::regexp}\z/ then
      graph << [resourceUri, predicate, RDF::URI.new(object) ]
    else
      graph << [resourceUri, predicate, object ]
    end

  end
end
