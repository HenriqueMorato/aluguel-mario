require 'rails_helper'

feature 'Visitor Use Navigation Menu' do
  scenario 'Visit Home' do
    visit new_property_path

    click_on 'Home'

    expect(current_path).to eq(root_path)
  end
  scenario 'Visit create property' do
    visit root_path
    click_on 'Cadastrar Imóvel'

    expect(current_path).to eq(new_property_path)
  end
  scenario 'Search property by location' do
    property_type = PropertyType.create(name: 'Sitio para festa')


    property = create(:property, property_type: property_type,
                      location: 'Juquitiba')

    visit root_path

    fill_in 'Busca por Localização', with: 'Juquitiba'

    click_on 'Buscar por Localização'

    expect(current_path).to eq(search_by_location_properties_path)
  end
  scenario 'Search Property by name' do
    property_type = PropertyType.create(name: 'Sitio para festa')

   property = create(:property, property_type: property_type,
                     title: 'Sitio para festa')

    visit root_path

    fill_in 'Busca por Tipo do Imóvel', with: 'Sitio para festa'

    click_on 'Buscar por Tipo'

    expect(current_path).to eq(search_by_type_properties_path)
  end
end
