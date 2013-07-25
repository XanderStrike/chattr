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
    @message.board = params[:board]

    respond_to do |format|
      if @message.save
        format.html { redirect_to Board.find(params[:board]), notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { redirect_to Board.find(params[:board]), notice: 'There was an error saving your message.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
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
