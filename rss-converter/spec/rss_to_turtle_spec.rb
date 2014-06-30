require "rspec/its"
require "rss_to_turtle"
require 'pry'

describe RSSToTurtle do
    let(:rss_string){
        '<rss version="2.0">
          <channel>
            <title>The tile</title>
            <link>http://bla</link>
            <description>The description</description>
            <item>
              <link>http://bla2</link>
              <title>Legal Justification For Snooping: Statement</title>
            </item>
            <item>
              <link>http://bla3</link>
              <title>Marco Civil: A World First Digital Bill of Rights</title>
            </item>
          </channel>
        </rss>'}
    it "should convert rss to turtle" do
        expect(RSSToTurtle.convert(rss_string)).to be == "@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .\n@prefix schema: <http://schema.org/> .\n\n<http://bla2> a schema:Article;\n   schema:headline \"Legal Justification For Snooping: Statement\";\n   schema:url <http://bla2> .\n\n<http://bla3> a schema:Article;\n   schema:headline \"Marco Civil: A World First Digital Bill of Rights\";\n   schema:url <http://bla3> .\n"
    end
end
