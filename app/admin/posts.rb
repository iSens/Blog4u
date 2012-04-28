ActiveAdmin.register Post do
  index do
    column :title
    column :name
    column :post_date
    default_actions
  end
  
  form :html => { :multipart => true } do |f|
     f.inputs "Post" do

      f.input :name
      f.input :title
      f.input :body
      f.input :post_date, :as => :date
      f.input :photo, :as => :file
      f.input :tags, :hint => "Select tags"
      
    end
    f.buttons
   end
   
   show do |ad|
         attributes_table do
           row :title
           row :name
           row :body
           row :photo do
             image_tag(ad.photo.url(:thumb))
           end
         end
         active_admin_comments
       end
   
       sidebar :help do
         "Need help? Email us at help@example.com"
       end

  
end
