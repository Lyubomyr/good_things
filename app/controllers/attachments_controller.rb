class AttachmentsController < ApplicationController

  # DELETE /attachments/1
  def destroy
    Attachment.find_by_id(params[:id]).delete
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

end
