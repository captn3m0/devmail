class Star < ApplicationRecord
  belongs_to :user, :counter_cache => true
  validates :repo_id, :uniqueness => [:repo_id, :user_id]
end
