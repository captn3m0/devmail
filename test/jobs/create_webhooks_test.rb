require 'test_helper'

class CreateWebhooksTest < ActiveJob::TestCase
  fixtures :users

  def setup
    @user = users(:default)
    @user.token = ENV['GITHUB_TEST_TOKEN']
  end

  test 'that stars are fetched' do
    CreateWebhookRepoJob.perform_now(@user)
  end

end
