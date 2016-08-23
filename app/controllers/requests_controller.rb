class RequestsController < ApplicationController
  before_action :set_request, only: [:show, :edit, :update, :destroy]

  def index
    @requests = current_user.requests.all
  end

  # GET /requests/new
  def new
    @request = current_user.requests.new
  end

  # GET /requests/1/edit
  def edit
  end

  def show
  end

  def create
    @request = current_user.requests.build(request_params)
    add_attachment_if_exists
    respond_to do |format|
      if @request.save
        format.html do
          UserMailer.request_created(current_user, @request).deliver_later
          redirect_to @request, notice: 'Request was successfully created.'
        end
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1
  def update
    respond_to do |format|
      add_attachment_if_exists
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.'}
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request/1
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_request
    request_to_check = current_user.requests.find(params[:id])
    if (request_to_check)
      @request = request_to_check
    else
      redirect_to(requests_url, alert: 'You have no rights to check or change the request.')
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def request_params
    params.require(:request).permit(:request_type, :title, :text, :status, :attachment)
  end

  def add_attachment_if_exists
    if (request_params[:attachment])
      @request.attachments.build attachment: request_params[:attachment], owner: current_user
    end
  end
end
