require_relative './config/boot'
require_relative './config/environment'

module Clockwork
  handler do |job|
    client = SlackNotify::Client.new(
      webhook_url: ENV['SLACK_WEBHOOK_URL'],
      channel: "#gemの実装",
      username: "mybot",
      link_names: 1
    )
    client.notify(Bot.find(rand(1..Bot.all.count)).requirement)
  end

  every(3.minutes, 'ゆっくり')
end
