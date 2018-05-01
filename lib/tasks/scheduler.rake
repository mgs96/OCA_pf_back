desc "Goes to http://cafeto.uninorte.edu.co/cree/acompanamiento_academico/apoyo/ and scrapes data"
task :scrape => :environment do
  def scrape

    Apoyo.destroy_all

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
      apoyos_array << Apoyo.new(subject: asignatura, nrc: nrc, day: dia, hour: hora, place: lugar, peer: par, email: correo, professor: profesor, strategy: estrategia).attributes
    end
    
    Apoyo.create apoyos_array
    puts "done"
  end
end