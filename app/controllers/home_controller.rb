class HomeController < ApplicationController
  def index
  end

  def manage
  	@users = User.all
  	@boards = Board.all
  end
end
