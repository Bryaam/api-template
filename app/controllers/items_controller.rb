class ItemsController < ApplicationController
  before_action :set_item, except: %i[index create]

  def index
    @items = Item.all.order(:id)
    json_response(@items)
  end

  def show
    json_response(@item)
  end

  def create
    @item = Item.create!(item_params)
    json_response(@item)
  end

  def update
    @item.update!(item_params)
    head :no_content
  end

  def destroy
    @item.destroy!
    head :no_content
  end

  private

  def item_params
    params.permit(:title)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
