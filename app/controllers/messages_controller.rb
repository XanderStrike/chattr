class MessagesController < ApplicationController
  def create
    @message = Message.new(params[:message])
    @message.owner = params[:owner]
    @message.username = params[:username]
    @message.board = params[:board]

    @message.save unless @message.content.blank?
  end

  def get
    render :json => Message.where(board: params[:id]).where("id > ?", params[:af])
  end
end
