class Authorization < ActiveRecord::Base

  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user = nil)
    user ||= User.create(:name => hash['user_info']['name'])
    Authorization.create(:user => user, :uid => hash['uid'], :provider => hash['provider'])
  end

end
