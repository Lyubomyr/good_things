class AttachmentsController < ApplicationController

  # DELETE /attachments/1
  def destroy
    Attachment.all[params[:id].to_i].delete
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

end