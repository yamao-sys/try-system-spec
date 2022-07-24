require 'factory_bot'

RSpec.configure do |config|
  # FactoryBot.method → methodで書けるように
  config.include FactoryBot::Syntax::Methods

  # 毎example毎にfactory_bot再読み込み(DB値のリセット)
  config.before :all do
    FactoryBot.reload
  end
end
