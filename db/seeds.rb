# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def lowercase_accents(string)
  string.gsub('Á','á').gsub('É','é').gsub('Í','í').gsub('Ó','ó').gsub('Ú','ú')
end


baja_california_site = Cms::Site.create!(
    label:       'Baja California',
    identifier:  'baja-california',
    hostname:    'seguridadconjusticiabc.org',
    locale:      'es',
    is_mirrored: false
)

baja_california_site.layouts.create(
    app_layout: "application.html.erb",
    label:      "application",
    identifier: "application",
    content:    "{{ cms:page:content:text }}",
    position:   0,
    is_shared:  false
)

chihuahua_site = Cms::Site.create!(
    label:       'Chihuahua',
    identifier:  'chihuahua',
    hostname:    'seguridadconjusticiach.org',
    locale:      'es',
    is_mirrored: false
)

chihuahua_site.layouts.create(
    app_layout: "application.html.erb",
    label:      "application",
    identifier: "application",
    content:    "{{ cms:page:content:text }}",
    position:   0,
    is_shared:  false
)

nuevo_leon_site = Cms::Site.create!(
    label:       'Nuevo Leon',
    identifier:  'nuevo-leon',
    hostname:    'seguridadconjusticianl.org',
    locale:      'es',
    is_mirrored: false
)

nuevo_leon_site.layouts.create(
    app_layout: "application.html.erb",
    label:      "application",
    identifier: "application",
    content:    "{{ cms:page:content:text }}",
    position:   0,
    is_shared:  false
)

#
# Admin Users
#

Admin.create(
    email:                 'admin@seguridadconjusticiabc.org',
    password:              'Passw0rd',
    password_confirmation: 'Passw0rd',
    site_id:               baja_california_site.id
)

Admin.create(
    email:                 'admin@seguridadconjusticiach.org',
    password:              'Passw0rd',
    password_confirmation: 'Passw0rd',
    site_id:               chihuahua_site.id
)

Admin.create(
    email:                 'admin@seguridadconjusticianl.org',
    password:              'Passw0rd',
    password_confirmation: 'Passw0rd',
    site_id:               nuevo_leon_site.id
)

#
# Banners Baja California
#

banner_bc_001 = Banner.create!(active: true, site_id: baja_california_site.id)
banner_bc_001.image = File.open(File.join(Rails.root, '/db/images/banner.png'))
banner_bc_001.save

#
# Banners Chihuahua
#

banner_ch_001 = Banner.create!(active: true, site_id: chihuahua_site.id)
banner_ch_001.image = File.open(File.join(Rails.root, '/db/images/banner.png'))
banner_ch_001.save

#
# Banners Nuevo Leon
#

banner_nl_001 = Banner.create!(active: true, site_id: nuevo_leon_site.id)
banner_nl_001.image = File.open(File.join(Rails.root, '/db/images/banner.png'))
banner_nl_001.save

#
# Phrases Baja California
#

# Phrase.create(phrase: 'no hubiera corrupción', site_id: baja_california_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: baja_california_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: baja_california_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: baja_california_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: baja_california_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: baja_california_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: baja_california_site.id)
# Phrase.create(phrase: 'gobernara otro partido', site_id: baja_california_site.id)
# Phrase.create(phrase: 'gobernara otro partido', site_id: baja_california_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: baja_california_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: baja_california_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: baja_california_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: baja_california_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: baja_california_site.id)

#
# Phrases Chihuahua
#

frases = File.read('doc/nube_palabras_chihuahua.csv').force_encoding('MacRoman').encode('UTF-8')
array_frases = CSV.parse(frases).flatten

array_frases.each do |frase|
  Phrase.create(phrase: lowercase_accents(frase.lstrip.downcase), site_id: chihuahua_site.id)
end

# Phrase.create(phrase: 'no hubiera corrupción', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'gobernara otro partido', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'gobernara otro partido', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: chihuahua_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: chihuahua_site.id)

#
# Phrases Nuevo Leon
#

# Phrase.create(phrase: 'no hubiera corrupción', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'no hubiera corrupción', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'la policia trabajara mejor', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'gobernara otro partido', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'gobernara otro partido', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: nuevo_leon_site.id)
# Phrase.create(phrase: 'los ciudadanos participaramos mas', site_id: nuevo_leon_site.id)

#
# Events Baja California
#

#Event.create(title: 'Evento BJ 1', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: baja_california_site.id, date: 1.day.from_now)
#Event.create(title: 'Evento BJ 3', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: baja_california_site.id, date: 2.day.from_now)
#Event.create(title: 'Evento BJ 3', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: baja_california_site.id, date: 3.day.from_now)


#
# Events Chihuahua
#

#Event.create(title: 'Evento Chihuahua 1', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: chihuahua_site.id, date: 1.day.from_now)
#Event.create(title: 'Evento Chihuahua 3', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: chihuahua_site.id, date: 2.day.from_now)
#Event.create(title: 'Evento Chihuahua 3', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: chihuahua_site.id, date: 3.day.from_now)

#
# Events Nuevo Leon
#

# Event.create(title: 'Evento Nuevo Leon 1', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: nuevo_leon_site.id, date: 1.day.from_now)
# Event.create(title: 'Evento Nuevo Leon 3', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: nuevo_leon_site.id, date: 2.day.from_now)
# Event.create(title: 'Evento Nuevo Leon 3', description: 'sed do eiusmod tempor incididunt', venue: 'Plaza Principal', site_id: nuevo_leon_site.id, date: 3.day.from_now)

#
# Political Parties Baja California
#

pp_bj_001 = PoliticalParty.create!(name: 'Partido Acción Nacional', initials: 'PAN', site_id: baja_california_site.id)
pp_bj_001.logo = File.open(File.join(Rails.root, '/db/images/logo_pan.gif'))
pp_bj_001.save

pp_bj_002 = PoliticalParty.create!(name: 'Nueva Alianza', initials: 'AN', site_id: baja_california_site.id)
pp_bj_002.logo = File.open(File.join(Rails.root, '/db/images/logo_nueva_alianza.jpg'))
pp_bj_002.save

pp_bj_003 = PoliticalParty.create!(name: 'Movimiento Progresista', initials: 'PRD/MC/PT', site_id: baja_california_site.id)
pp_bj_003.logo = File.open(File.join(Rails.root, '/db/images/logo_movimiento_progresista.png'))
pp_bj_003.save

pp_bj_004 = PoliticalParty.create!(name: 'Compromiso por México', initials: 'PRI/PVM', site_id: baja_california_site.id)
pp_bj_004.logo = File.open(File.join(Rails.root, '/db/images/logo_compromiso_por_mexico.jpg'))
pp_bj_004.save

#
# Political Parties Chihuahua
#

pp_bj_001 = PoliticalParty.create!(name: 'Partido Acción Nacional', initials: 'PAN', site_id: chihuahua_site.id)
pp_bj_001.logo = File.open(File.join(Rails.root, '/db/images/logo_pan.gif'))
pp_bj_001.save

pp_bj_002 = PoliticalParty.create!(name: 'Nueva Alianza', initials: 'AN', site_id: chihuahua_site.id)
pp_bj_002.logo = File.open(File.join(Rails.root, '/db/images/logo_nueva_alianza.jpg'))
pp_bj_002.save

pp_bj_003 = PoliticalParty.create!(name: 'Movimiento Progresista', initials: 'PRD/MC/PT', site_id: chihuahua_site.id)
pp_bj_003.logo = File.open(File.join(Rails.root, '/db/images/logo_movimiento_progresista.png'))
pp_bj_003.save

pp_bj_004 = PoliticalParty.create!(name: 'Compromiso por México', initials: 'PRI/PVM', site_id: chihuahua_site.id)
pp_bj_004.logo = File.open(File.join(Rails.root, '/db/images/logo_compromiso_por_mexico.jpg'))
pp_bj_004.save

#
# Political Parties Nuevo Leon
#

pp_bj_001 = PoliticalParty.create!(name: 'Partido Acción Nacional', initials: 'PAN', site_id: nuevo_leon_site.id)
pp_bj_001.logo = File.open(File.join(Rails.root, '/db/images/logo_pan.gif'))
pp_bj_001.save

pp_bj_002 = PoliticalParty.create!(name: 'Nueva Alianza', initials: 'AN', site_id: nuevo_leon_site.id)
pp_bj_002.logo = File.open(File.join(Rails.root, '/db/images/logo_nueva_alianza.jpg'))
pp_bj_002.save

pp_bj_003 = PoliticalParty.create!(name: 'Movimiento Progresista', initials: 'PRD/MC/PT', site_id: nuevo_leon_site.id)
pp_bj_003.logo = File.open(File.join(Rails.root, '/db/images/logo_movimiento_progresista.png'))
pp_bj_003.save

pp_bj_004 = PoliticalParty.create!(name: 'Compromiso por México', initials: 'PRI/PVM', site_id: nuevo_leon_site.id)
pp_bj_004.logo = File.open(File.join(Rails.root, '/db/images/logo_compromiso_por_mexico.jpg'))
pp_bj_004.save

#
# Load Positions
#

posturas = File.read('doc/seguridad.csv').force_encoding('MacRoman').encode('UTF-8')
posturas_seguridad = CSV.parse(posturas, :headers => true)

[baja_california_site, chihuahua_site, nuevo_leon_site].each do |site|
  posturas_seguridad.each do |posturas|
    tema = Topic.find_or_create_by_name_and_site_id_and_kind posturas['tema'], site.id ,'seguridad'
    PoliticalParty.by_site(site.id).each do |political_party|
      Position.create(
        content: posturas[political_party.name.to_s],
        political_party_id: political_party.id,
        topic_id: tema.id,
        site_id: site.id
      ) if posturas[political_party.name.to_s].present?
    end
  end
end

posturas = File.read('doc/justicia.csv').force_encoding('MacRoman').encode('UTF-8')
posturas_justicia = CSV.parse(posturas, :headers => true)

[baja_california_site, chihuahua_site, nuevo_leon_site].each do |site|
  posturas_justicia.each do |posturas|
    tema = Topic.find_or_create_by_name_and_site_id_and_kind posturas['tema'], site.id ,'justicia'
    PoliticalParty.by_site(site.id).each do |political_party|
      Position.create(
        content: posturas[political_party.name.to_s],
        political_party_id: political_party.id,
        topic_id: tema.id,
        site_id: site.id
      ) if posturas[political_party.name.to_s].present?
    end
  end
end