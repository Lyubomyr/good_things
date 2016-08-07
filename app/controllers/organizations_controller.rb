class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]

  def index
    @organizations = current_user.organizations.all
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  def show
  end

  def create
    @organization = Organization.new(organization_params)
    @organization.users << current_user
    if (organization_params[:attachment])
      add_attachment
    end
    respond_to do |format|
      if @organization.save!
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  def update
    respond_to do |format|
      if (organization_params[:attachment])
        add_attachment
      end
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.'}
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization/1
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @org_to_check = Organization.find(params[:id])
    if (@org_to_check.users.ids.include? current_user.id)
      @organization = @org_to_check
    else
      redirect_to(organizations_url, alert: 'You have no rights to check or change the organization.')
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    params.require(:organization).permit(:name, :description, :address, :contacts, :attachment)
  end

  def add_attachment
      @organization.attachments.build attachment: params[:organization][:attachment], owner: current_user
  end

end
