class Task < ActiveRecord::Base
  belongs_to :child
  ratyrate_rateable 'mark'
end
