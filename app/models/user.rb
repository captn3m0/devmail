class User < ActiveRecord::Base

  validates_uniqueness_of :userid

  def self.create_from_omnihash(omnihash)
    user = create name: omnihash[:info][:name],
                  email: omnihash[:info][:email],
                  userid: omnihash[:uid],
                  nick: omnihash[:info][:nickname],
                  token: omnihash[:credentials][:token]

    # Make sure you return an instance of the User class
    # always
    if user.save
      user
    else
      find_by_userid(omnihash[:uid])
    end
  end
end
