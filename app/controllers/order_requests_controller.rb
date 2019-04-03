class OrderRequestsController < ApplicationController
  before_action :find_order_request, only: [:new, :show, :edit, :update, :destroy]

  def index
    if params[:selection].eql? 'pending'
      current_user.admin? ? @order_requests = OrderRequest.all_pending.paginate(:per_page => 4, :page => params[:page]) : @order_requests = current_user.order_requests.all_pending.paginate(:per_page => 4, :page => params[:page])
    elsif params[:selection].eql? 'accept'
      current_user.admin? ? @order_requests = OrderRequest.all_accepted.paginate(:per_page => 4, :page => params[:page]) : @order_requests = current_user.order_requests.all_accepted.paginate(:per_page => 4, :page => params[:page])
    elsif params[:selection].eql? 'reject'
      current_user.admin? ? @order_requests = OrderRequest.all_rejected.paginate(:per_page => 4, :page => params[:page]) : @order_requests = current_user.order_requests.all_rejected.paginate(:per_page => 4, :page => params[:page])
    elsif params[:selection].eql? 'complete'
      current_user.admin? ? @order_requests = OrderRequest.all_completed.paginate(:per_page => 4, :page => params[:page]) : @order_requests = current_user.order_requests.all_completed.paginate(:per_page => 4, :page => params[:page])
    else
      current_user.admin? ? @order_requests = OrderRequest.all.paginate(:per_page => 4, :page => params[:page]) : @order_requests = current_user.order_requests.paginate(:per_page => 4, :page => params[:page])    
    end

    respond_to do |format|
      format.js
      format.html
    end

  end

  def show
    gon.longitude = @order_request.longitude
    gon.latitude = @order_request.latitude
  end


  def new
    @order_request = OrderRequest.new
  end

  def create
    @order_request = current_user.order_requests.new(order_request_params)
    if @order_request.save
      redirect_to user_order_requests_path(current_user), notice: "Your order is created successfully"
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @order_request.update(order_request_params)
      redirect_to order_requests_path, notice: "Your order is created successfully"
    else
      flash[:notice] = "Your order can not be updated"
      render :edit
    end
  end

  def destroy
    if @order_request.destroy
      redirect_to order_requests_path, notice: 'Order is successfully deleted.'
    else
      flash[:alert] = 'Failed to delete order.' 
    end
  end

  def change_status
    @order_request = OrderRequest.find_by_id(params[:id])
    if @order_request.present?
      if OrderRequest.statuses.include? params[:status]
        if @order_request.update(status: params[:status])
          respond_to do |format|
            format.js
          end
        end
      end
    end
  end


  private

  def find_order_request
    @order_request = OrderRequest.find_by_id(params[:id])
  end

  def order_request_params
    params.require(:order_request).permit(:user_id, :order_name, :quantity, :amount, :country, :city, :house_num, :longitude, :latitude)
  end
end
