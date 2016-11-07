require 'rails_helper'

describe 'Admin dashboard' do
  scenario 'it has a list of all orders' do
    category = Fabricate(:category)
    items1 = Fabricate.times(5, :item, category: category)
    items2 = Fabricate.times(2, :item, category: category)
    user1 = Fabricate(:user)
    user2 = Fabricate(:user)

    order1 = Order.create(user: user1)
    order2 = Order.create(user: user2)
    order1.items << items1
    order2.items << items2

    order1.items.each do |item|
      item.orders_items[0].quantity = 1
      item.orders_items[0].save
    end

    order2.items.each do |item|
      item.orders_items[0].quantity = 1
      item.orders_items[0].save
    end

    admin = Fabricate(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_content(order1.created_at.strftime('%B %d, %Y'))
    expect(page).to have_content(order2.created_at.strftime('%B %d, %Y'))
  end
end