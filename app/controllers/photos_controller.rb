class PhotosController < ApplicationController

def show
@photo = Photo.find(params["the_id_number"])
render("show.html.erb")
end

def index
@all_photos = Photo.order({:created_at => :desc}).all
render("index.html.erb")
end

def new_form
render("new_form.html.erb")
end

def create_row
#The params look like this:
#Parameters: {"the_image_url"=>"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_120x44dp.png", #"the_caption"=>"google logo"}

p = Photo.new
p.source = params["the_image_url"]
p.caption = params["the_caption"]
p.save
redirect_to("http://localhost:3000/photos")
end

def edit_form
  @the_photo_to_be_edited = Photo.find(params["the_id"])

render("edit_form.html.erb")
end

def update_row
p = Photo.find(params[:the_id])
p.source = params[:the_source]
p.caption = params[:the_caption]
p.save
@url = "/photos/"+params[:the_id].to_s
redirect_to(@url)
end

def delete_photo
p = Photo.find(params[:the_id])
p.destroy
p.save
redirect_to("/photos")
end

end
