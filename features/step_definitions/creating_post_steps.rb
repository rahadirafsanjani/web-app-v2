Given /^there is a simple blog form$/ do
  visit new_post_path
end

When /^I create a blog post$/ do
  fill_in 'title', with: 'this is title'
  fill_in 'post_body', with: 'this is body'
  click_button 'Create Post'
end

Then /^I should see "(.*?)" in the post (.*?)\.$/ do |content, field|
  expect(page).to have_content content
end