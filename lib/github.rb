require 'octokit'

class Github

  def initialize(user)
    @client = Octokit::Client.new access_token: user.token
    @user = user
    @config = Rails.application.config.github
  end

  def fetch_stars
    if (@config['star_fetch_all'] === '1')
      @client.auto_paginate = true
    end
    @client.starred(@user.nick, :accept => 'application/vnd.github.v3.star+json', :per_page => @config['star_fetch_count'])
  end
end

