require 'rails_helper'

RSpec.describe "foods/new", type: :view do
  before(:each) do
    assign(:food, Food.new(
      :name => "MyString",
      :order => nil,
      :cost => 1
    ))
  end

  it "renders new food form" do
    render

    assert_select "form[action=?][method=?]", foods_path, "post" do

      assert_select "input[name=?]", "food[name]"

      assert_select "input[name=?]", "food[order_id]"

      assert_select "input[name=?]", "food[cost]"
    end
  end
end
