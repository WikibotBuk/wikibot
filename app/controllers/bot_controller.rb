require 'slack-ruby-bot'

class PongBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

class BotController < ApplicationController
  def test
    ::PongBot.run
    render plain: "OK"
  end
end
