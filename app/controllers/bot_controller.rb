require 'slack-ruby-bot'

class WikiBot < SlackRubyBot::Bot
  command 'ping' do |client, data, match|
    client.say(text: 'pong (jose h)', channel: data.channel)
  end

  command 'crear' do |client, data, match|
    text = data.text.partition("crear").last.strip
    question = text[/#{"#PREGUNTA#"}(.*?)#{"#RESPUESTA#"}/m, 1].strip
    answer = text[/#{"#RESPUESTA#"}(.*?)#{"#CATEGORÍA#"}/m, 1].strip
    kind = text[/#{"#CATEGORÍA#"}(.*?)#{"#SUB-CATEGORÍA#"}/m, 1].strip
    subtype = text.partition("#SUB-CATEGORÍA#").last.strip

    new_wiki = Wiki.create(question: question, answer: answer, kind: kind, subtype: subtype)
    if new_wiki.save!
      texto = "Creado!!! question: #{question}, answer: #{answer}, kind: #{kind}, subtype: #{subtype}"
      client.say(text: texto, channel: data.channel)
    else
      client.say(text: "OH NO! algo salio mal revisa que la estrucutra sea: \n#PREGUNTA# esta es la pregunta\n#RESPUESTA# esta es la respuesta\n#CATEGORÍA# tipo\n#SUB-CATEGORÍA# subtipo", channel: data.channel)
    end
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
