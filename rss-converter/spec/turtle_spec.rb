require 'turtle'
require 'resource'

describe Turtle do

  prefixes = {
      rdf: 'http://www.w3.org/1999/02/22-rdf-syntax-ns#',
      schema: 'http://schema.org/'
  }

  context "given a resource of type schema:Article with title" do

    resource = Resource.new("http://the/link/#thelink", "Article")
      .add_property("headline", "About the project")

    turtle = Turtle.new(prefixes)
      .add_resource(resource)

    it "should convert to turtle format" do
      turtle_as_string = turtle.to_s

      expected =
"@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix schema: <http://schema.org/> .

<http://the/link/#thelink> a schema:Article;
   schema:headline \"About the project\" .\n"

      expect(turtle_as_string).to eq(expected)
    end
  end

    context "given a resource of schema:Article with more than one property" do

      resource = Resource.new("http://the/link/#thelink", "Article")
        .add_property("headline", "A message of congratulations...")
        .add_property("articleSection", "General")
        .add_property("datePublished", "Mon, 23 Jun 2014 10:59:34 +0000")
        .add_property("author","Dillon Mann")

      turtle = Turtle.new(prefixes)
        .add_resource(resource)

      it "should convert to turtle format" do
        turtle_as_string = turtle.to_s

        expected =
  "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix schema: <http://schema.org/> .

<http://the/link/#thelink> a schema:Article;
   schema:articleSection \"General\";
   schema:author \"Dillon Mann\";
   schema:datePublished \"Mon, 23 Jun 2014 10:59:34 +0000\";
   schema:headline \"A message of congratulations...\" .\n"

        expect(turtle_as_string).to eq(expected)
      end
    end

    context "given a resource of schema:Article with properties that are URLs" do
        resource = Resource.new("http://the/link/#theLink", "Article")
            .add_property("url", "http://webfoundation.org/2014/06/a-message-of-congratulations/")
            .add_property("image", "http://webfoundation.org/2014/06/a-message-of-congratulations/#someImage")

        turtle = Turtle.new(prefixes)
            .add_resource(resource)

        it "should generate the url triples in the format '<url>'instead of '\"url\"'" do
            turtle_as_string = turtle.to_s
            expected = "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .\n@prefix schema: <http://schema.org/> .\n\n<http://the/link/#theLink> a schema:Article;\n   schema:image <http://webfoundation.org/2014/06/a-message-of-congratulations/#someImage>;\n   schema:url <http://webfoundation.org/2014/06/a-message-of-congratulations/> .\n"
            expect(turtle_as_string).to eq(expected)
        end
    end

end
