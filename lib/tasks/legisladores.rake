# encoding: utf-8

REPRESENTATIVE_IDS = [9216595,9217023,9218109,9218099,9216585,9217097,9216842,9215624,9218107,9218113,9218115,9218117,
                      9218103,9216838,9217028,9215762,9215730,9215714,9218238,9215732,9215700,9215698,9215710,9215706,
                      9217111,9216818,9215736,9217040,9217220,9216147,9216635,9217822,9216759,9216388,9216386,9216161,
                      9216785,9216159,9216149,9216151,9216641,9217959,9216390,9216617,9216382,9216392,9217236,9217222,
                      9216623,9216163]

namespace :legislatura do
  namespace :LXII do    
    desc "Fotos Legislatura LXII"
    task :fotos => [:environment] do
      dip_subidos = []
      dip_no_subidos = []
      REPRESENTATIVE_IDS.each do |diputado_id|
        puts "===================================="
        url = "http://sil.gobernacion.gob.mx/Librerias/pp_PerfilLegislador.php?SID=&Referencia=#{diputado_id}"
        doc = Nokogiri::HTML(open(url))
        puts "Pagina #{url} scrapeada"
        if doc
          nombre = doc.at_css('td.tddatosazul b').text.split(',')
          nombre = "#{nombre[1].strip} #{nombre[0].strip}"
          dip_no_subidos << nombre
          puts "Diputado -> |#{nombre}|"
          diputado = Representative.where('representatives.name iLIKE ?',"%#{nombre}%")
          diputado = (diputado.size == 1) ? diputado.first : nil
          if diputado
            imagen = doc.at_css('img[title="Foto del Legislador"]').attributes['src'].to_s
            imagen = "http://sil.gobernacion.gob.mx#{imagen}"
            puts "Foto -> #{imagen}"
            unless imagen == 'http://sil.gobernacion.gob.mx/Archivos/Fotos/fotoNoDisponible.jpg'
              diputado.remote_avatar_url = imagen
              diputado.save!
              puts "Foto subida!!!!"
              dip_subidos << nombre
            end
          end
        end

      end
      puts "===================================="
      puts dip_subidos.join(', ')
      puts "#{dip_subidos.size} fotos subidas"
      puts "===================================="
      dip_no_subidos = dip_no_subidos - dip_subidos
      puts dip_no_subidos.join(', ')
      puts "#{dip_no_subidos.size} fotos subidas"
    end
    
    desc "Task description"
    task :update => [:environment] do
      CSV.foreach('doc/legisladores.csv', :headers => true) do |diputado|
        
        site = case diputado['entidad']
        when 'Baja California'
          Cms::Site.find(1)
        when 'Chihuahua'
          Cms::Site.find(2)
        when 'Nuevo León'
          Cms::Site.find(3)
        end
        
        partido = PoliticalParty.where(name: diputado['partido'], site_id: site.id).first
                
        partido = PoliticalParty.create(name: diputado['partido'], site_id: site.id) unless partido

        Representative.create({
          name: "#{diputado['nombre']} #{diputado['apellidos']}",
          political_party_id: partido.id,
          site_id: site.id,
          twitter: diputado['twitter'],
          district: diputado['distrito'],
          circumscription: diputado['circunscripcion'],
          substitute: "#{diputado['suplente_nombre']} #{diputado['suplente_apellido']}"
        })

      end
    end
  end
end