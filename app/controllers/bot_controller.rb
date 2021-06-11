require 'slack-ruby-bot'

class WikiBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  Wiki.all.each do |wiki|
    command wiki.question do |client, data, match|
      client.say(text: wiki.answer, channel: data.channel)
    end
  end
end

class BotController < ApplicationController

  def test
    ::WikiBot.run
  end
end
