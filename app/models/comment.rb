class Comment < ActiveRecord::Base
  belongs_to :post, :counter_cache => true
  belongs_to :admin
  validates_presence_of :answer
end
