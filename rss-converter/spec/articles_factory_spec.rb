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
              <link>http://bla2</link>
              <title>Legal Justification For Snooping: Statement</title>
            </item>
            <item>
              <link>http://bla3</link>
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
        <rss xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" xmlns:slash="http://purl.org/rss/1.0/modules/slash/" version="2.0">
          <channel>
            <title>The tile</title>
            <link>http://bla</link>
            <description>The description</description>
            <item>
            <title>
                Open Contracting Data Standard Draft Released for Comment
            </title>
            <link>
            http://webfoundation.org/2014/06/opencontracting-datamodel/
            </link>
            <comments>
            http://webfoundation.org/2014/06/opencontracting-datamodel/#comments
            </comments>
            <pubDate>Thu, 26 Jun 2014 17:57:45 +0000</pubDate>
            <dc:creator>
            <![CDATA[ Michael Roberts ]]>
            </dc:creator>
            <category>
            <![CDATA[ Projects ]]>
            </category>
            <category>
            <![CDATA[ Open Government Data ]]>
            </category>
            <category>
            <![CDATA[ opencontracting ]]>
            </category>
            <guid isPermaLink="false">http://webfoundation.org/?p=10667</guid>
            <description>
            <![CDATA[
            <p>The World Wide Web Foundation is pleased to announce the <a href="http://ocds.open-contracting.org/standard/">first release of the Open Contracting Data Standard (OCDS)</a>, which aims to enhance and promote disclosure and participation in public contracting, for broad consultation. In this release, we present &#8230;</p>
            ]]>
            </description>
            <content:encoded>
            <![CDATA[ Um teste muito legal :D
            ]]>
            </content:encoded>
            <wfw:commentRss>
            http://webfoundation.org/2014/06/opencontracting-datamodel/feed/
            </wfw:commentRss>
            <slash:comments>0</slash:comments>
            </item>
          </channel>
        </rss>
      eos

    rss = RSS::Parser.parse(rss_string)

    context "when creating an article from rss" do

      articlesFactory = ArticlesFactory.new
      article = articlesFactory.create(rss)[0]

      it "should set the article title" do
        expect(article.title).to eq("Open Contracting Data Standard Draft Released for Comment")
      end

      it 'should set the article url' do
        expect(article.url).to eq("http://webfoundation.org/2014/06/opencontracting-datamodel/")
      end

      it 'should set the article author' do
        expect(article.author).to eq("Michael Roberts")
      end

      it 'should set the article description' do
        expect(article.description).to eq('<p>The World Wide Web Foundation is pleased to announce the <a href="http://ocds.open-contracting.org/standard/">first release of the Open Contracting Data Standard (OCDS)</a>, which aims to enhance and promote disclosure and participation in public contracting, for broad consultation. In this release, we present &#8230;</p>')
      end

      it 'should set the article articleBody' do
        expect(article.articleBody).to eq('Um teste muito legal :D')
      end

    end

  end

end
