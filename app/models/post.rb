class Post < ActiveRecord::Base
  
  has_many :comments, :dependent => :destroy
  has_many :tags
  has_attached_file :photo,
                  :styles => { :medium => "250x250>",
                               :thumb => "100x100>" },
  :url => "/posts/:attachment/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/posts/:attachment/:id/:style/:basename.:extension"                             

  validates_attachment_presence :photo  
  validates_attachment_size :photo, :less_than => 1.megabytes  
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
 
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
