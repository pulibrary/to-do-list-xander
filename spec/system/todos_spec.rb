# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Todo Pages" do
  context "when visiting index page" do
    it "renders header and links" do
      visit "/todos"
      expect(page).to have_content("Todo")
      expect(page).to have_link "New Todo"
    end
    it "can creates new todo" do
      # visit "/todos"
      visit todos_path
      click_on 'New Todo'
      fill_in 'Description', with: 'Test Description'
      click_button 'Create Todo'
      expect(page).to have_content('Test Description')
      expect(page).to have_css('div.container')
      expect(page).to have_selector('a[href="/todos"]', text: 'Back')
    end
    it 'display table with descriptions' do
      test_todo = Todo.create(description: "test todo")
      visit todos_path
      expect(page).to have_content(test_todo.description)
    end
  end
end