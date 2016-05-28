class Task < ActiveRecord::Base
  belongs_to :child
  ratyrate_rateable 'mark'

  def start_time
    self.created_at
  end
end
