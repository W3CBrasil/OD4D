# Site Structure

The OD4D website has the following sections:

- About the Platform
- Terms and Conditions
- Become a Partner
- Become a Contributor Writing Posts
- Concepts
- Reference Materials
- Capacity Building
- Glossary
- Projects
- Products

These sections may be divided into two categories, **static pages** and **article sections**. The latter is used to display **articles** that are both generated from the CMS or from the RSS-to-Turtle gem.

#### Static Pages

- About the Platform
- Terms and Conditions
- Become a Partner
- Become a Contributor Writing Articles
- Glossary

These static pages need to be edited directly through their source files (look into the ***app/views/pages*** and ***app/views/learn***). The static pages' URLs are in the form of *** http://platform.od4d.org/some-identifier-of-the-page ***.

#### Article Sections

- Concepts
- Reference Materials
- Capacity Building
- Projects
- Products

Article Sections are generated dinamically and will load **all the articles** from this section. If there is **only one article** on a given article section, this article will be shown instead of a listing with only one item. This mechanism may be used to simulate a "static page" but using an CMS-editable article.

The article sections' URL are in the form of *** http://platform.od4d.org/articles/filter/articleSection/SectionName ***.

#### Articles

As stated before, the articles may be originated from:

- Imported from RSS via the RSS-to-Turtle application
- Created using the CMS tool

NOTE: When posts are imported using the RSS-to-CMS application (as importing all the previous posts from the OD4D.org website) they **will not** be available on the website, even though they will show up on the CMS. They need to be manually saved/modified in order to that.