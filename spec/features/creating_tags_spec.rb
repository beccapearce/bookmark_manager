require 'spec_helper'
require './app/app.rb'

feature 'adding a single tag to a link' do
  scenario 'user clicks on add tag' do
    visit '/links/new'
    fill_in 'url', with: 'rckpprscslzdspk.herokuapp.com'
    fill_in 'title', with: 'Rock Paper Scissors Lizard Spock'
    fill_in 'tags', with: 'game'
    click_button 'Add Link'
    expect(current_path).to eq '/links'
    link = Link.first
    expect(link.tags.map(&:name)).to include 'game'
  end
end
