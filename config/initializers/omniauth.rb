# To change this template, choose Tools | Templates
# and open the template in the editor.

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'H0PobKam07kkcP024wQdNQ', '2iQnsNUiX9CxdsLBOZXbQQ7hSSBrU0ZwyDpzMif7Qs'
#  provider :facebook, 'APP_ID', 'APP_SECRET'
#  provider :linked_in, 'CONSUMER_KEY', 'CONSUMER_SECRET'
end