require 'rails_helper'

RSpec.describe 'New students can be added to all assignments' do

  before do
    User.create(name: 'jill', email: 'jill@jill.com',
      password: 'password', role: 'student', course_name: 'GBO INC')
    User.create(name: 'jim', email: 'jim@jim.com',
      password: 'password', role: 'admin', course_name: 'GBO INC')
    Assignment.create(title: 'Bio', description: 'Write a bio',
      due_date: Date.new(2017-1-1))
    Homework.create(title: 'cool file', user_id: 1,
      assignment_id: 1)
    visit '/'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('You have logged in.')
  end

  it 'can create new student' do
    flunk
  end

  it 'can add all assignments to new student' do
    flunk
  end

end
