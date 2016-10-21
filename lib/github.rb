require 'octokit'

class Github

  def initialize(token)
    @client = Octokit::Client.new access_token: token
  end

  def
end

