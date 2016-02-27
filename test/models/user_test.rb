require 'test_helper'
require 'yaml'

class UserTest < ActiveSupport::TestCase

  def setup
    @omnihash = YAML.parse %q{
uid: "584253"
info:
  nickname: "captn3m0"
  email: "me@captnemo.in"
  name: "Nemo"
  image: "https://avatars.githubusercontent.com/u/584253?v=3"
  urls:
    GitHub: "https://github.com/captn3m0"
    Blog: "https://captnemo.in"
credentials:
  token: "fake_github_token"
  expires: false
}
  puts @omnihash.to_yaml

  end

  test "create_from_omnihash" do
    user = User.create_from_omnihash @omnihash
    assert_is_a User, user
    assert_equal user.username
  end
end
