class Place < ApplicationRecord
    has_attached_file :picture1, validate_media_type: false, default_url: "house.png"
    has_attached_file :picture2, validate_media_type: false, default_url: "house.png"
    has_attached_file :picture3, validate_media_type: false, default_url: "house.png"
    has_attached_file :picture4, validate_media_type: false, default_url: "house.png"
    has_attached_file :picture5, validate_media_type: false, default_url: "house.png"
    validates_attachment :picture1, :picture2, :picture3, :picture4, :picture5
    do_not_validate_attachment_file_type :picture1, :picture2, :picture3, :picture4, :picture5
end
