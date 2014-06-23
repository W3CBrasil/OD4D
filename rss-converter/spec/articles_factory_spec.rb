require 'rss'
require 'articles_factory'

describe ArticlesFactory do

  it "should create two articles from rss" do
    rss_string = <<-eos
        <rss version="2.0">
          <channel>
            <title>The tile</title>
            <link>http://bla</link>
            <description>The description</description>
            <item>
              <title>Legal Justification For Snooping: Statement</title>
            </item>
            <item>
              <title>Marco Civil: A World First Digital Bill of Rights</title>
            </item>
          </channel>
        </rss>
      eos

    rss = RSS::Parser.parse(rss_string)

    articlesFactory = ArticlesFactory.new
    articles = articlesFactory.create(rss)

    expect(articles.count).to eq(2)
  end

  context "given a valid rss with one item" do

    rss_string = <<-eos
        <rss version="2.0">
          <channel>
            <title>The tile</title>
            <link>http://bla</link>
            <description>The description</description>
            <item>
              <title>Legal Justification For Snooping: Statement</title>
              <link>http://link.com</link>
            </item>
          </channel>
        </rss>
      eos

    rss = RSS::Parser.parse(rss_string)

    context "when creating an article from rss" do

      articlesFactory = ArticlesFactory.new
      article = articlesFactory.create(rss)[0]

      it "should set the article title" do
        expect(article.title).to eq("Legal Justification For Snooping: Statement")
      end

      it 'should set the article link' do
        expect(article.link).to eq("http://link.com")
      end

    end

  end

end
