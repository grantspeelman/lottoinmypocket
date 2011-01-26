class Authorization < ActiveRecord::Base

  belongs_to :user
  validates :user_id, :uid, :provider, :presence => true 
  validates_uniqueness_of :uid, :scope => :provider

  after_destroy :destroy_user
  
  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash['provider'], hash['uid'])
  end

  def self.create_from_hash(hash, user = nil)
    user ||= User.create(:name => hash['user_info']['name'])
    Authorization.create(:user => user, :uid => hash['uid'], :provider => hash['provider'])
  end
  
  protected

  def destroy_user
    user.destroy if user && user.authorizations.empty?
  end

end
