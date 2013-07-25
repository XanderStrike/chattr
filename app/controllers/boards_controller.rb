class BoardsController < ApplicationController
  
  def show
    @board = Board.find(params[:id])
    @messages = Message.where(board: @board.id).last(100)

    respond_to do |format|
      format.html 
      format.json { render json: @board }
    end
  end

  def new
    @board = Board.new

    respond_to do |format|
      format.html 
      format.json { render json: @board }
    end
  end
  
  def edit
    @board = Board.find(params[:id])
  end
  
  def create
    @board = Board.new(params[:board])

    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, notice: 'Board was successfully created.' }
        format.json { render json: @board, status: :created, location: @board }
      else
        format.html { render action: "new" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    @board = Board.find(params[:id])

    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @board = Board.find(params[:id])
    @board.destroy
    Message.where(board: params[:id]).map(&:destroy)

    redirect_to "/manage"
  end
end
