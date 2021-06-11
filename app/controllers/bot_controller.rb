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
      client.say(text: '¡No existe la pregunta! ¿Deseas crearla?', channel: data.channel)
    end
  end

  command 'hola' do |client, data, match|
    client.say(text: '¡Hola! Soy Superwikibot, tu super ayudante en Buk 💪🦸‍♂️. Para comenzar escribe *help*.', channel: data.channel)
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
  rescue
    client.say(text: "OH NO! algo salio mal revisa que la estrucutra sea: \n#PREGUNTA# esta es la pregunta\n#RESPUESTA# esta es la respuesta\n#CATEGORÍA# tipo\n#SUB-CATEGORÍA# subtipo", channel: data.channel) 
  end

  command 'editar' do |client, data, match|
    text = data.text.partition("editar").last.strip
    actual_question = text[/#{"#PREGUNTA-ACTUAL#"}(.*?)#{"#PREGUNTA-NUEVA#"}/m, 1].strip
    question = text[/#{"#PREGUNTA-NUEVA#"}(.*?)#{"#RESPUESTA-NUEVA#"}/m, 1].strip
    answer = text[/#{"#RESPUESTA-NUEVA#"}(.*?)#{"#CATEGORÍA-NUEVA#"}/m, 1].strip
    kind = text[/#{"#CATEGORÍA-NUEVA#"}(.*?)#{"#SUB-CATEGORÍA-NUEVA#"}/m, 1].strip
    subtype = text.partition("#SUB-CATEGORÍA-NUEVA#").last.strip

    wiki = Wiki.find_by(question: actual_question)
    wiki.update(question: question, answer: answer, kind: kind, subtype: subtype)
    if wiki.save!
      texto = "Actualizado!!! \nquestion: #{question}\nanswer: #{answer}\nkind: #{kind}\nsubtype: #{subtype}"
      client.say(text: texto, channel: data.channel)
    else
      client.say(text: "OH NO! algo salio mal revisa que la estrucutra sea: ", channel: data.channel)
    end
  rescue
    client.say(text: "OH NO! algo salio mal revisa que la estrucutra sea: ", channel: data.channel) 
  end
end

class BotController < ApplicationController

  def test
    ::WikiBot.run
  end
end
