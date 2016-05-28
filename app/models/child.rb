class Child < ActiveRecord::Base
  extend FriendlyId
  has_attached_file :avatar, styles: { medium: "152x152#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true

  belongs_to :parent
  has_many :tasks, dependent: :destroy

  friendly_id :name, use: [:slugged, :finders]

  def should_generate_new_friendly_id?
    new_record?
  end
end
