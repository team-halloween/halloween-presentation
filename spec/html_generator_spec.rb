require_relative 'spec_helper'

describe HTMLGenerator do

  # it "can be initialized" do

  let(:an_html_generator) {HTMLGenerator.new}

  it "can probably parse the URL" do
    expect(an_html_generator).to respond_to(:parse_url)
  end

  it "can probably return HTML" do
    expect(an_html_generator).to respond_to(:give_html)
  end

  it "can probably generate the index" do
    expect(an_html_generator).to respond_to(:generate_index)
  end

  it "can probably generate a category page" do
    expect(an_html_generator).to respond_to(:generate_category)
  end

  it "can probably generate an item page" do
    expect(an_html_generator).to respond_to(:generate_item)
  end


end