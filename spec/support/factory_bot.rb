# FactoryBotを使えるようにします。
# 使用するとuser = create(:user) のようにDB登録やモデルのビルドができるため便利です。
# spec配下にsupportフォルダとfactory_bot.rbファイルを作成し、下記のように記述します。
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end