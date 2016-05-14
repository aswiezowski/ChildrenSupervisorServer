module ApplicationHelper

  def profile_avatar_select(child)
    return image_tag child.avatar.url(:medium), id: 'image-preview', class: 'img-responsive img-circle profile-image' if child.avatar.exists?
    image_tag 'default-avatar.jpg', id: 'image-preview', class: 'img-responsive img-circle profile-image'
  end
end
