class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Parent"
  belongs_to :rateable, :polymorphic => true
end
