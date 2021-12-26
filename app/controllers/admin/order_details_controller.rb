class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    if @order_detail.update(order_detail_params)
      order = @order_detail.order

      if @order_detail.making_status_before_type_cast == 2
         @order_detail.order.update(order_status: 2)
      elsif @order_detail.making_status_before_type_cast == 3
         bool = true
          order.order_details.each do |f|
            if f.making_status_before_type_cast != 3
               bool = false
            end
          end
         if bool
            @order_detail.order.update(order_status: 3)
         end
      end

      redirect_to admin_order_path(order), notice: "対応ステータスを更新しました"
    else
      render :show, alert: "対応ステータスを更新できませんでした"
    end
  end

  private

   def order_detail_params
    params.require(:order_detail).permit(:making_status)
   end

  end
