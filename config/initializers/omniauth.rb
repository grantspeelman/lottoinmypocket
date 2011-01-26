# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'openid/store/filesystem'


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'H0PobKam07kkcP024wQdNQ', '2iQnsNUiX9CxdsLBOZXbQQ7hSSBrU0ZwyDpzMif7Qs'
  provider :facebook, '195846973763305', '65bc5413e0a214ef4ce402e207f117b0',
           :grant_type => 'client_credentials'
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new(Rails.root.join('tmp'))
#  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end