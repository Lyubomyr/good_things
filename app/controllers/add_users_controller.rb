class AddUsersController < ApplicationController
  before_action :admin_only,:set_add_user, only: [:show, :edit, :update, :destroy]

  # GET /add_users
  # GET /add_users.json
  def index
    @add_users = AddUser.all
  end

  # GET /add_users/1
  # GET /add_users/1.json
  def show
  end

  # GET /add_users/new
  def new
    @add_user = AddUser.new
  end

  # GET /add_users/1/edit
  def edit
  end

  # POST /add_users
  # POST /add_users.json
  def create
    @add_user = AddUser.new(add_user_params)

    respond_to do |format|
      if @add_user.save
        format.html { redirect_to @add_user, notice: 'Add user was successfully created.' }
        format.json { render :show, status: :created, location: @add_user }
      else
        format.html { render :new }
        format.json { render json: @add_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /add_users/1
  # PATCH/PUT /add_users/1.json
  def update
    respond_to do |format|
      if @add_user.update(add_user_params)
        format.html { redirect_to @add_user, notice: 'Add user was successfully updated.' }
        format.json { render :show, status: :ok, location: @add_user }
      else
        format.html { render :edit }
        format.json { render json: @add_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /add_users/1
  # DELETE /add_users/1.json
  def destroy
    @add_user.destroy
    respond_to do |format|
      format.html { redirect_to add_users_url, notice: 'Add user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_add_user
      @add_user = AddUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def add_user_params
      params.fetch(:add_user, {})
    end
end
