require 'rdf'
require 'rdf/turtle'

theLink = RDF::URI.new("http://od4d.com/#resource")

graph = RDF::Graph.new do
  self << [theLink, RDF.type, RDF::SCHEMA.Article]
  self << [theLink, RDF::SCHEMA.title,   "About the project"]
  self << [theLink, RDF::SCHEMA.author, "W3C"]
end

output = RDF::Turtle::Writer.buffer(base_uri:  "http://od4d.com/", prefixes:  {
    schema: "http://schema.org/"}
) do |writer|
  graph.each_statement do |statement|
    writer << statement
  end
end

puts output
