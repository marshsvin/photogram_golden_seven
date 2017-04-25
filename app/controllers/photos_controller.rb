class PhotosController < ApplicationController

def show
p = Photo.find(params["the_id_number"])
@the_image_url = p.source
@caption = p.caption
@created_at = p.created_at
render("show.html.erb")
end

def index
@all_photos = Photo.all
render("index.html.erb")
end

end
