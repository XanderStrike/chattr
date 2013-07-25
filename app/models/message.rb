class Message < ActiveRecord::Base
  attr_accessible :content, :owner, :username
end
