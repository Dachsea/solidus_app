class MessageCard < ActiveRecord::Base
  has_many :messages
end
