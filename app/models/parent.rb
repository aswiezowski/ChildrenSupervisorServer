class Parent < ActiveRecord::Base
  extend FriendlyId
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :children, dependent: :destroy
  ratyrate_rater
  friendly_id :parent_name, use: [:slugged, :finders]

  validates :parent_name, presence: true

  def should_generate_new_friendly_id?
    new_record?
  end
end
