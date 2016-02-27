class User < ActiveRecord::Base
  def self.create_from_omnihash(omnihash)
    omnihash[:uid]
  end
end
