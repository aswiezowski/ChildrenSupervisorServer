class Task < ActiveRecord::Base
  belongs_to :child
  ratyrate_rateable 'mark'

  scope :after_date, ->(date) { where('created_at > ?', date) }

  def start_time
    self.created_at
  end
end
