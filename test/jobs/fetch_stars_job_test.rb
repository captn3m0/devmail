require 'test_helper'

class FetchStarsJobTest < ActiveJob::TestCase
  fixtures :users

  def setup
    @user = users(:default)
    @user.token = ENV['GITHUB_TEST_TOKEN']
    @user.stars.destroy_all
  end

  test 'that stars are fetched' do
    FetchStarsJob.perform_now(@user)
    assert_equal 3, @user.stars.size
  end

  test "that re-running doesn't cause issues" do
    2.times do
      FetchStarsJob.perform_now(@user)
    end
    pp @user.stars
    assert_equal 3, @user.stars.size
  end
end
