require 'spec_helper'

describe "records/show" do
  before(:each) do
    @record = assign(:record, stub_model(Record,
      :timestamp => "",
      :point => "",
      :step => "",
      :longitude => "",
      :latitude => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
