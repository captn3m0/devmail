class User < ActiveRecord::Base
  def self.create_from_omnihash(omnihash)

    user = self.create name: omnihash[:info][:name],
      email: omnihash[:info][:email],
      userid: omnihash[:uid],
      nick: omnihash[:info][:nickname],
      token: omnihash[:credentials][:token]

    # Make sure you return an instance of the User class
    # always
    if user.save
      user
    else
      self.find_by_userid(omnihash[:uid])
    end
  end


end
