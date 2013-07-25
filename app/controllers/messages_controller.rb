class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    @message.owner = params[:owner]
    @message.username = User.find(params[:owner]).name
    @message.board = params[:board]

    @message.save
  end

  def get
    render :json => Message.where(board: params[:id]).where("id > ?", params[:af])
  end
end
