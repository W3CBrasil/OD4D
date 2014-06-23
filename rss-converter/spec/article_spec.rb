require "article"

describe Article do

  context "given an article" do

    article = Article.new("the title", "http://the/link")

    context "when it is converted to a resource" do

      resource = article.to_resource

      it "the resource should have an uri" do
        expect(resource.uri).to eq("http://the/link")
      end

      it "the resource should have a type" do
        expect(resource.type).to eq("schema:Article")
      end

      it "the resource should have a property title" do
        expect(resource.properties["title"]).to eq("the title")
      end

      it "the resource should have a property link" do
        expect(resource.properties["link"]).to eq("http://the/link")
      end
    end

  end

end
