require 'slack-ruby-bot'

class WikiBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong', channel: data.channel)
  end

  command 'q', /[^q]/ do |client, data, match|
    wiki = Wiki.find_by(question: match["expression"].strip)
    if wiki
      client.say(text: wiki.answer, channel: data.channel)
    else
      client.say(text: 'Comando no válido.', channel: data.channel)
    end
  end
end

class BotController < ApplicationController

  def test
    ::WikiBot.run
  end
end
