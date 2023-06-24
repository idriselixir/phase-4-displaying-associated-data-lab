# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  def index
    items = Item.all
    render json: items_with_user(items)
  end

  private

  def items_with_user(items)
    items.map do |item|
      {
        id: item.id,
        name: item.name,
        description: item.description,
        price: item.price,
        user: user_details(item.user)
      }
    end
  end

  def user_details(user)
    {
      id: user.id,
      username: user.username,
      city: user.city
    }
  end
end
