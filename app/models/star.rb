class Star < ApplicationRecord
  belongs_to :user
  validates :repo_id, :scope => [:repo_id, :user_id]
end
