class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  class Apoyo
    def initialize(subject, nrc, day, hour, place, peer, email, professor, strategy)
      @subject = subject
      @nrc = nrc
      @day = day
      @hour = hour
      @place = place
      @peer = peer
      @email = email
      @professor = professor
      @strategy = strategy
    end
  
    attr_reader :subject
    attr_reader :nrc
    attr_reader :day
    attr_reader :hour
    attr_reader :place
    attr_reader :peer
    attr_reader :email
    attr_reader :professor
    attr_reader :strategy
  end

  def scrape_apoyos
    require 'open-uri'

    page = Nokogiri::HTML(open("http://cafeto.uninorte.edu.co/cree/acompanamiento_academico/apoyo/"))
  
    apoyos_array = []
    
    page.css('tr').each_with_index do |row, i|
      asignatura = row.css('td')[0].text
      nrc = row.css('td')[1].text
      dia = row.css('td')[2].text
      hora = row.css('td')[3].text
      lugar = row.css('td')[4].text
      par = row.css('td')[5].text
      correo = row.css('td')[6].text
      profesor = row.css('td')[7].text
      estrategia = row.css('td')[8].text
      apoyos_array << Apoyo.new(asignatura, nrc, dia, hora, lugar, par, correo, profesor, estrategia)
    end
    
    render json: { data: apoyos_array }
  end
end
