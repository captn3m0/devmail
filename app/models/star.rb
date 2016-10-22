class Star < ApplicationRecord
  belongs_to :user
  validates :repo_id, :uniqueness => [:repo_id, :user_id]
end
