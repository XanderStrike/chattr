class Message < ActiveRecord::Base
  attr_accessible :content, :owner

  def username
  	User.find(owner).name
  end
end
