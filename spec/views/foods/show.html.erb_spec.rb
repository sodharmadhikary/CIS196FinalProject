require 'rails_helper'

RSpec.describe "foods/show", type: :view do
  before(:each) do
    @food = assign(:food, Food.create!(
      :name => "Name",
      :order => nil,
      :cost => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
  end
end
