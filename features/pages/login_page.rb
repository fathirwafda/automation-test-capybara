require 'capybara/dsl'
require 'selenium-webdriver'

class LoginPage < SitePrism::Page

    element :user_name_field, '#user-name'
    element :password_field, '#password'
    element :button_login, '#login-button'

    def login(password)
      wait_until_user_name_field_visible(wait: 5)

      username_field = find(:xpath, '//*[@id="login_credentials"]')
      username_data = username_field.text.split("\n")[1..-1]
      username = username_data[0]
      puts username
      # user_name_field.set(username_field)
      user_name_field.set(username)
      wait_until_password_field_visible(wait: 5)
      password_field.set(password)
      button_login.click
    end
end
