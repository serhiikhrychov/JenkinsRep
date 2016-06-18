When(/^I sent mail for reset password for user with id '(.*)'$/) do |email|
  @optimize_hit.forgotten_password_page.forgot_password_link.click
  @optimize_hit.forgotten_password_page.forgot_your_password_field.set email
  @optimize_hit.forgotten_password_page.go_button.click
end

Then(/^I get email to mailbox with link and click on it$/) do
Gmail.new(EnvConfig.get(:email), EnvConfig.get(:email_password)) do |gmail|
  sleep 10
  email = gmail.inbox.emails(:unread, :from => "admin@optimizehit.com").first
  @verification_link = parse_link_from(email.body.decoded)
  #@verification_link = CGI::unescapeHTML(@verification_link)
  @verification_link.should_not be_nil
  #@verification_link = CGI::unescape(@verification_link)
  visit @verification_link
end
end

When(/^I fill in 'Input_Password' field with password '(.*)' and click on 'Go' button$/) do |password|
  @optimize_hit.forgotten_password_page.reset_your_password.set password
  @optimize_hit.forgotten_password_page.go_button.click
end

When(/^I open 'Forgot your password'$/) do
  @optimize_hit.forgotten_password_page.forgot_password_link.click
end

When(/^I fill in 'Forgot your password' field with '(.*)'$/) do |data|
 @optimize_hit.forgotten_password_page.forgot_your_password_field.set data
end