class Task < ApplicationRecord
  belongs_to :project
  belongs_to :project_member
end
