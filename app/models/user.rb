class User < ActiveRecord::Base
  has_many :authorizations

  def authorized_with_everything
    self.authorizations.count == 3
  end
  
  def authorized_with(provider)
    self.authorizations.count(:conditions => {:provider => provider.to_s}) != 0
  end

end
