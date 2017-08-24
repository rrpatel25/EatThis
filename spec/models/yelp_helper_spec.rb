require 'spec_helper'

describe 'yelp-helper call' do


  it "returns a yelp hash object" do
    p YelpHelper.search
    expect(YelpHelper.search).to be_kind_of(Response)
  end

  it "returns a list of businesses" do
    expect(YelpHelper.first.first).to eq("businesses")
  end

  it "returns a business's yelp id" do
    expect(YelpHelper.search.first.second.first.first).to eq(["id", "christinas-place-chicago-2"])
  end

end
