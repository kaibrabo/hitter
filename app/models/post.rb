class Post < ApplicationRecord
    validates :user_id, presence: true
    #add validation that requires the image field to be present
    validates :image, presence: true

    has_attached_file :image, styles: { medium: '640x640'}

    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    belongs_to :user


end
