class Project < ApplicationRecord
  has_many :tasks
  has_many :project_members
  has_many :users, through: :project_members
end
