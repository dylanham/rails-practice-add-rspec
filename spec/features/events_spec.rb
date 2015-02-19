require 'rails_helper'

feature 'You should be able to visit the root path and see something' do
  it 'should show the events index' do
    visit root_path
    expect(page).to have_content  'All Events'
  end
  it 'should be able to make a new event' do
    visit root_path
    click_on 'New Event'
    fill_in 'Description', with: 'This event is awesome'
    fill_in 'Location', with: 'Your moms house'
    fill_in 'Date', with: '12122020'
    fill_in 'Capacity', with: '100'
    check 'Requires ID'
    click_on 'Create Event'
    expect(page).to have_content 'This event is awesome'
    expect(page).to have_content 'Your moms house'
    expect(page).to have_content '100'
    expect(page).to have_content 'true'
  end

  it 'User edits an event' do
    Event.create!(description: 'My aweeesome event')
    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'edit'
    fill_in 'Description', with: 'My awesome event'
    click_on 'Update Event'
    expect(page).to have_content('My awesome event')
    expect(page).to have_no_content('My aweeesome event')
  end

  it 'should be able to delete an event' do
    Event.create!(description: 'My aweeesome event')
    visit root_path
    expect(page).to have_content('My aweeesome event')
    click_on 'delete'
  end

  it 'should be able to view the show of an item' do
    Event.create!(description: 'Poop')
    visit root_path
    click_on 'Poop'
    expect(page).to have_content 'Poop'
    click_on 'Show all events'
    expect(page).to have_content 'All Events'
  end
end
