class MessagesController < ApplicationController

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.owner = params[:owner]
    @message.username = User.find(params[:owner]).name
    @message.board = params[:board]

    @message.save
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  def get
    render :json => Message.where(board: params[:id]).where("id > ?", params[:af])
  end
end
