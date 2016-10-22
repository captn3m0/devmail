require 'test_helper'
require 'yaml'
require 'pp'

class UserTest < ActiveSupport::TestCase
  def setup
    @omnihash = YAML.load_file(file_fixture('omnihash.yml')).deep_symbolize_keys
  end

  test 'create_from_omnihash' do
    user = User.create_from_omnihash @omnihash
    assert user.is_a? User
    assert_equal @omnihash[:info][:nickname], user.nick
    assert_equal @omnihash[:info][:name], user.name
    assert_equal @omnihash[:info][:email], user.email

    assert_equal @omnihash[:uid].to_i, user.userid
    assert_equal @omnihash[:credentials][:token], user.token
  end

  test 'login twice should create user once' do
    user = User.create_from_omnihash @omnihash
    assert user.is_a? User
    assert_equal @omnihash[:uid].to_i, user.userid

    user2 = User.create_from_omnihash @omnihash
    assert_equal user, user2
  end
end
