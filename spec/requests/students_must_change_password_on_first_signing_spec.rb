require 'rails_helper'

RSpec.describe 'students go to pw reset first' do
  before do
    User.create(
      name: 'jill',
      email: 'jill@jill.com',
      password: 'password',
      role: 'student',
      course_name: 'GBO INC'
    )
    new_admin = User.create(name: 'jim', email: 'jim@jim.com',
      password: 'password', role: 'admin', course_name: 'GBO INC')
    new_assignment = Assignment.create(title: 'Bio', description: 'Write a bio',
      due_date: Date.new(2017-1-1))
    new_homework = Homework.create(title: 'cool file', user_id: 1,
      assignment_id: 1)
    visit '/'
    expect(page).to have_text('You must log in to access this page')
    fill_in 'email', with: 'jill@jill.com'
    fill_in 'password', with: 'password'
    click_button 'Log in'
    expect(page).to have_text('You have logged in.')
  end

  it 'student has property of first_login' do
    flunk
  end

  it 'student is takend to password reset upon first login' do
    flunk
  end

  it 'student must change password to progress' do
    flunk
  end

  it 'student is given confirmation message' do
    flunk
  end
end
