require 'github'

class FetchStarsJob < ApplicationJob
  queue_as :default

  def perform(user)
    gh = Github.new user

    star_list = gh.fetch_stars

    star_objects = []

    star_list.each do |star|
      star_objects.append(
        starred_at: star.starred_at,
        repo_id: star.repo.id,
        repo: star.repo.full_name
      )

    end

    # We do a single batch write
    user.stars.create star_objects
  end
end
