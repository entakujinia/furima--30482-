class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_street_address = PurchasestreetAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_street_address = PurchasestreetAddress.new(purchase_params)
    if @purchase_street_address.valid?
       pay_item
      @purchase_street_address.save
      return redirect_to root_path
    else
      render action: :index
    end
  end


  private

  def purchase_params
   params.require(:purchasestreet_address).permit(:post_code,:prefecture_id,:city,:address,:appointment_name,:phone_number,:purchase).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp.api_key = "sk_test_4f8e57005541c62eca0fe602"  
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
