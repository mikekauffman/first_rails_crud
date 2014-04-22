require 'spec_helper'

feature "Players" do
  scenario "Homepage displays list of players and which team they are on" do

    visit '/'
    click_on 'Create Player'

    fill_in 'player_name', with: 'Cal Ripken'
    fill_in 'player_team', with: 'Baltimore Orioles'
    click_on 'Create'

    expect(page).to have_content 'Cal Ripken'
    expect(page).to have_content 'Baltimore Orioles'
  end  

end