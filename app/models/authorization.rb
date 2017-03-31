class Authorization < ActiveRecord::Base

  belongs_to :user
  validates :user_id, :uid, :provider, :presence => true 
  validates_uniqueness_of :uid, :scope => :provider

  after_destroy :destroy_user
  
  def self.find_from_hash(hash)
    find_by_provider_and_uid(hash.fetch('provider'), hash.fetch('uid'))
  end

  def self.create_from_hash(hash, user = nil)
    user ||= User.create(:name => hash.fetch('info').fetch('name'))
    Authorization.create(:user => user, :uid => hash.fetch('uid'), :provider => hash.fetch('provider'))
  end
  
  protected

  def destroy_user
    user.destroy if user && user.authorizations.empty?
  end

end
