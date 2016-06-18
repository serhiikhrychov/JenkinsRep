module CommonHelper

  require 'rubygems'
  #require 'active_support/core_ext/numeric/time'

  def unique_email(email)
    (EnvConfig.get :email).split('@').first + email + @random_string + '@gmail.com'
  end

  def unique_value(value)
    value + @random_string
  end



  def parse_link_from(message)
    /<a(.*?)href=(.*?)"(.*?)recover(.*?)">(.*?)<\/a>/m.match(message).to_s.scan(/>([^"]*)</)[0].pop.gsub(/=\s/,'').gsub("3D",'')
  end


  #def parse_link_from(message, link)
  #  doc = Nokogiri::HTML(message)
  #  node = doc.search('a').detect { |a| a.text.include? link }
  #  node['href'] if node
  #end


  def convert_time(time, format)
    if time.include? 'today'
      parsed_time = time.split('today')
      if parsed_time.size < 2
        Time.now.strftime(format)
      else
        shift = time.gsub(/\D/, '').to_i.days.to_i
        parsed_time = (time.include? '+') ? Time.now + shift : Time.now - shift
        parsed_time.strftime(format)
      end
    end
  end
end
