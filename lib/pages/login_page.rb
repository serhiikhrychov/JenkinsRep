class LoginPage < SitePrism::Page



  set_url ''

  element :email_field, '[name="email"]'
  element :password_field, '[name="password"]'
  element :sign_in_button, '[value="Sign in"]'
  element :provide_a_valid_Login_ID, '[class="red"]'


  def login_as (email, password)
    email_field.set email
    password_field.set password
    sign_in_button.click

  end

  def exists?
    assert_exists
    true
  rescue Exception::UnknownObjectException
    false
  end


end
