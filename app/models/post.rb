class Post < ActiveRecord::Base
  belongs_to :admin
  acts_as_taggable
  acts_as_taggable_on :tag_list
  
  
end
