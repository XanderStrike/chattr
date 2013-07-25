class HomeController < ApplicationController
  def manage
  	@users = User.all
  	@boards = Board.all
  end
end
