require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        :name => "Name"
      ),
      Order.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
