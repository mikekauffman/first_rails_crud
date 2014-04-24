require 'spec_helper'

feature "Players" do
  scenario "Homepage displays list of players and which team they are on" do

    visit '/'
    click_on 'View Players'
    click_on 'Create Player'

    fill_in 'player_name', with: 'Cal Ripken'
    fill_in 'player_team', with: 'Baltimore Orioles'
    click_on 'Create'

    expect(page).to have_content 'Cal Ripken'
    expect(page).to have_content 'Baltimore Orioles'
  end

  scenario "A Player's information can be edited or deleted" do

    visit '/'
    click_on 'View Players'
    click_on 'Create Player'

    fill_in 'player_name', with: 'Cal Ripken'
    fill_in 'player_team', with: 'Baltimore Orioles'
    click_on 'Create'

    click_on 'Create Player'

    fill_in 'player_name', with: 'Big Papi'
    fill_in 'player_team', with: 'BoSox'
    click_on 'Create'

    expect(page).to have_content 'Big Papi'
    expect(page).to have_content 'BoSox'

    click_on 'Big Papi details'
    click_on 'edit'
    fill_in 'player_name', with: 'David Ortiz'
    fill_in 'player_team', with: 'Boston Red Sox'
    click_on 'Update'

    expect(page).to have_content 'David Ortiz'
    expect(page).to have_content 'Boston Red Sox'

    click_on 'David Ortiz details'
    click_on 'edit'
    click_on 'Delete'
    expect(page).to have_content 'Cal Ripken'
    expect(page).to_not have_content 'David Ortiz'

  end


end