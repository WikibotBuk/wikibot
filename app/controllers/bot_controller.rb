require 'slack-ruby-bot'

class WikiBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end
end

class BotController < ApplicationController

  def test
    ::WikiBot.run
  end
end
