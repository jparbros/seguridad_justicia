# encoding: utf-8

namespace :legislatura do
  namespace :LXII do    
    desc "Task description"
    task :update => [:environment] do
      CSV.foreach('doc/legisladores.csv', :headers => true) do |diputado|
        nombre = "#{diputado['nombre']} #{diputado['apellidos']}"
        representante = Representative.find_by_name(nombre)
        partido = PoliticalParty.find_by_name(diputado['partido'])
        region = Region.find_by_name(diputado['entidad'])
        if representante
          representante.twitter = diputado['twitter'] if diputado['twitter'].present?
          representante.political_party = partido if partido.present?
          representante.region = region if region.present?
          representante.district = diputado['distrito'] if diputado['distrito'].present?
          representante.circumscription = diputado['circunscripcion'] if diputado['circunscripcion'].present?
          representante.substitute = "#{diputado['suplente_nombre']} #{diputado['suplente_apellido']}" if diputado['suplente_nombre'].present? && diputado['suplente_apellido'].present?
          representante.save!
        else
          puts "NO ENCONTRADO => #{nombre}"
        end      
      end
    end
  end
end