require 'spec_helper'

describe "records/new" do
  before(:each) do
    assign(:record, stub_model(Record,
      :timestamp => "",
      :point => "",
      :step => "",
      :longitude => "",
      :latitude => ""
    ).as_new_record)
  end

  it "renders new record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", records_path, "post" do
      assert_select "input#record_timestamp[name=?]", "record[timestamp]"
      assert_select "input#record_point[name=?]", "record[point]"
      assert_select "input#record_step[name=?]", "record[step]"
      assert_select "input#record_longitude[name=?]", "record[longitude]"
      assert_select "input#record_latitude[name=?]", "record[latitude]"
    end
  end
end
