require 'slack-ruby-bot'

class WikiBot < SlackRubyBot::Bot
  text_error = "Mmh... no entendí nada. Mejor pregúntale a Camilo 🤫"
  command 'ping' do |client, data, match|
    client.say(text: 'pong 🏓', channel: data.channel)
  end

  command 'q', /[^q]/ do |client, data, match|
    wiki = Wiki.find_by(question: match["expression"].strip)
    if wiki
      client.say(text: wiki.answer, channel: data.channel)
    else
      client.say(text: '¡No existe la pregunta! ¿Deseas crearla?', channel: data.channel)
    end
  end

  command 'lista' do |client, data, match|
    search_kind = data.text.partition("lista").last.strip
    if search_kind.present? && !search_kind.blank?
      find_wikis = Wiki.where(kind: search_kind)
      if find_wikis.any?
        text = " 😺🐈 Esta es una lista de preguntas disponibles para la categorías *#{search_kind}* 🐈😺: \n\n"
        find_wikis.group_by(&:kind).each do |kind, wikis|
          text += "#{kind}:\n #{wikis.map{|wiki| "\t#{wiki.question}\n"}.join("")} \n" 
        end
        client.say(text: text, channel: data.channel)
      else

      end
    else
      text = " 😺🐈 Esta es una lista de preguntas disponibles 🐈😺: \n\n"
      Wiki.all.group_by(&:kind).each do |kind, wikis|
        text += "#{kind}:\n #{wikis.map{|wiki| "\t#{wiki.question}\n"}.join("")} \n" 
      end
      client.say(text: text, channel: data.channel)
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
      texto = "Bravo! 🚀 Has creado tu contenido!"
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
      texto = "Eres un verdadero héroe! 🤩  Se editó: #{actual_question}\n"
      client.say(text: texto, channel: data.channel)
    else
      client.say(text: "OH NO! algo salio mal revisa que la estrucutra sea: \n#PREGUNTA-ACTUAL# {pregunta a editar}\n#PREGUNTA-NUEVA# {pregunta}\n#RESPUESTA-NUEVA# {respuesta}\n#CATEGORÍA-NUEVA# {categoría}\n#SUB-CATEGORÍA-NUEVA# {sub-categoría}\n", channel: data.channel)
    end
  rescue
    client.say(text: text_error, channel: data.channel) 
  end

  command 'eliminar' do |client, data, match|
    text = data.text.partition("eliminar").last.strip
    actual_question = text.strip
    wiki = Wiki.find_by(question: actual_question)
    if wiki.nil?
      texto = "¡Oh, oh! Creo que no he encontrado tu pregunta. 😕"
      client.say(text: texto, channel: data.channel)
    else
      if wiki.destroy!
        texto = "Pow! 💥 Eliminaste *#{actual_question}*."
        client.say(text: texto, channel: data.channel)
      else
        client.say(text: "Hubo un error, no puedes elminiar la pregunta *#{actual_question}* 😕", channel: data.channel) 
      end
    end
  rescue
    client.say(text: text_error, channel: data.channel) 
  end

  command 'help' do |client, data, match|
    text = "Estos son los temas en los que te puedo ayudar 💯:\n
    *Hola*\npor si quieres saludarme 💪🦸‍♂️\n
    *Q {pregunta}*\npuedes hacerme la pregunta que quieras!\n
    *Lista*\nSi no sabes que preguntar puedes escribir lista y te mostraré las categorías y subcategorías que podrían interesarte!\n
    *Crear*\n*#PREGUNTA# {pregunta} *\n*#RESPUESTA# {respuesta} *\n*#CATEGORÍA# {categoría} *\n*#SUB-CATEGORÍA# {sub-categoría}*\nCon este comando puedes agregar el contenido que desees!\n
    *Editar*\n*#PREGUNTA-ACTUAL# {pregunta a editar} *\n*#PREGUNTA-NUEVA# {pregunta} *\n*#RESPUESTA-NUEVA# {respuesta} *\n*#CATEGORÍA-NUEVA# {categoría} *\n*#SUB-CATEGORÍA-NUEVA# {sub-categoría}*\nCon este comando puedes actualizar el contenido que desees!\n\n
    *Eliminar {pregunta}*\nSi una pregunta ya no sirve, eliminala!\n
    *Ping*\npong 🏓"
    client.say(text: text, channel: data.channel)
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
