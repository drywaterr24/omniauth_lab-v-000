class User < ActiveRecord::Base

  def self.from_omniauth(auth)

     where(name: auth['info']['name']).first_or_create do |user|
       user.name = auth['info']['name']
       user.uid = auth['uid']
       user.email = auth['info']['email']
     end
  end
end
