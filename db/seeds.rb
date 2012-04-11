# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
baja_california_site = Cms::Site.create!(
    label:       'Baja California',
    identifier:  'baja-california',
    hostname:    'bc.seguridad-justicia.parbros.com',
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
    hostname:    'ch.seguridad-justicia.parbros.com',
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
    hostname:    'nl.seguridad-justicia.parbros.com',
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
    email:                 'bc-user@seguridad-juticia.com',
    password:              '123456',
    password_confirmation: '123456',
    site_id:               baja_california_site.id
)

Admin.create(
    email:                 'ch-user@seguridad-juticia.com',
    password:              '123456',
    password_confirmation: '123456',
    site_id:               chihuahua_site.id
)

Admin.create(
    email:                 'nl-user@seguridad-juticia.com',
    password:              '123456',
    password_confirmation: '123456',
    site_id:               nuevo_leon_site.id
)

#
# Banners Baja California
#

banner_bc_001 = Banner.create!(active: true, site_id: baja_california_site.id)
banner_bc_001.image = File.open(File.join(Rails.root, '/db/images/bc001.gif'))
banner_bc_001.save

banner_bc_002 = Banner.create!(active: true, site_id: baja_california_site.id)
banner_bc_002.image = File.open(File.join(Rails.root, '/db/images/bc002.gif'))
banner_bc_002.save

banner_bc_003 = Banner.create!(active: true, site_id: baja_california_site.id)
banner_bc_003.image = File.open(File.join(Rails.root, '/db/images/bc003.gif'))
banner_bc_003.save


#
# Banners Chihuahua
#

banner_ch_001 = Banner.create!(active: true, site_id: chihuahua_site.id)
banner_ch_001.image = File.open(File.join(Rails.root, '/db/images/ch001.gif'))
banner_ch_001.save

banner_ch_002 = Banner.create!(active: true, site_id: chihuahua_site.id)
banner_ch_002.image = File.open(File.join(Rails.root, '/db/images/ch002.gif'))
banner_ch_002.save

banner_ch_003 = Banner.create!(active: true, site_id: chihuahua_site.id)
banner_ch_003.image = File.open(File.join(Rails.root, '/db/images/ch003.gif'))
banner_ch_003.save

#
# Banners Nuevo Leon
#

banner_nl_001 = Banner.create!(active: true, site_id: nuevo_leon_site.id)
banner_nl_001.image = File.open(File.join(Rails.root, '/db/images/nl001.gif'))
banner_nl_001.save

banner_nl_002 = Banner.create!(active: true, site_id: nuevo_leon_site.id)
banner_nl_002.image = File.open(File.join(Rails.root, '/db/images/nl002.gif'))
banner_nl_002.save

banner_nl_003 = Banner.create!(active: true, site_id: nuevo_leon_site.id)
banner_nl_003.image = File.open(File.join(Rails.root, '/db/images/nl003.gif'))
banner_nl_003.save

#
# Phrases Baja California
#

Phrase.create(phrase: 'Lorem ipsum dolor sit amet', site_id: baja_california_site.id)
Phrase.create(phrase: 'consectetur adipisicing elit', site_id: baja_california_site.id)
Phrase.create(phrase: 'sed do eiusmod tempor incididunt', site_id: baja_california_site.id)
Phrase.create(phrase: 'ut labore et dolore magna aliqua', site_id: baja_california_site.id)
Phrase.create(phrase: 'Ut enim ad minim veniam', site_id: baja_california_site.id)
Phrase.create(phrase: 'quis nostrud exercitation', site_id: baja_california_site.id)
Phrase.create(phrase: 'ullamco laboris nisi ut aliquip', site_id: baja_california_site.id)
Phrase.create(phrase: 'ex ea commodo consequat', site_id: baja_california_site.id)
Phrase.create(phrase: 'Duis aute irure dolor in', site_id: baja_california_site.id)
Phrase.create(phrase: 'reprehenderit in voluptate velit ', site_id: baja_california_site.id)

#
# Phrases Chihuahua
#

Phrase.create(phrase: 'Lorem ipsum dolor sit amet', site_id: chihuahua_site.id)
Phrase.create(phrase: 'consectetur adipisicing elit', site_id: chihuahua_site.id)
Phrase.create(phrase: 'sed do eiusmod tempor incididunt', site_id: chihuahua_site.id)
Phrase.create(phrase: 'ut labore et dolore magna aliqua', site_id: chihuahua_site.id)
Phrase.create(phrase: 'Ut enim ad minim veniam', site_id: chihuahua_site.id)
Phrase.create(phrase: 'quis nostrud exercitation', site_id: chihuahua_site.id)
Phrase.create(phrase: 'ullamco laboris nisi ut aliquip', site_id: chihuahua_site.id)
Phrase.create(phrase: 'ex ea commodo consequat', site_id: chihuahua_site.id)
Phrase.create(phrase: 'Duis aute irure dolor in', site_id: chihuahua_site.id)
Phrase.create(phrase: 'reprehenderit in voluptate velit ', site_id: chihuahua_site.id)

#
# Phrases Chihuahua
#

Phrase.create(phrase: 'Lorem ipsum dolor sit amet', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'consectetur adipisicing elit', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'sed do eiusmod tempor incididunt', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'ut labore et dolore magna aliqua', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'Ut enim ad minim veniam', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'quis nostrud exercitation', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'ullamco laboris nisi ut aliquip', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'ex ea commodo consequat', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'Duis aute irure dolor in', site_id: nuevo_leon_site.id)
Phrase.create(phrase: 'reprehenderit in voluptate velit ', site_id: nuevo_leon_site.id)