require 'rspec/its'
require 'resource'

describe Resource do
  subject(:resource) {Resource.new("http://example.com", "schema:Article")}
  its(:uri)  {is_expected.to be == "http://example.com"}
  its(:type) {is_expected.to be == "schema:Article"}
  it {expect(resource.add_property("a", "1")).to respond_to(:a)}
  it {expect(resource.add_property("a_b", "1")).to respond_to(:a_b)}
  it {expect(resource.add_property("testCamel", "1")).to respond_to(:testCamel)}
  it {expect(resource.add_property("key_with_no_object", "")).not_to respond_to(:testCamel)}
  it {expect{resource.add_property(nil, "")}.to raise_error}
  it {expect{resource.add_property("", "")}.to raise_error}
end
