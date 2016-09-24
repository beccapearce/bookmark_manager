def sign_up
  visit 'users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'mali@bum.com'
  fill_in :password, with: 'Isuck'
  fill_in :password_confirmation, with: 'Isuck'
  click_button 'Sign up'
end

def mismatched_password_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email, with: 'mali@isgreat.com'
  fill_in :password, with: 'IRule'
  fill_in :password_confirmation, with: 'IStillRule'
  click_button 'Sign up'
end

def no_email_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :password, with: 'Isuck'
  fill_in :password_confirmation, with: 'Isuck'
  click_button 'Sign up'
end

def no_email_sign_up
  visit '/users/new'
  fill_in :email, with: "Mali smells"
  expect(page.status_code).to eq(200)
  fill_in :password, with: 'Isuck'
  fill_in :password_confirmation, with: 'Isuck'
  click_button 'Sign up'
end
