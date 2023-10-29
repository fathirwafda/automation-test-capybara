Given("I visit to SauceDemo website") do
  @browser = HomePage.new
  @browser.load
end

When("I log in with valid credentials") do
  @signin = LoginPage.new
  @signin.login(ENV['PASSWORD'])
end

Then("I should be logged in") do
  expect(page).to have_content('Products')
end

When("I sort products by highest price") do
  @products_page = ProductsPage.new
  @products_page.click_sort
end

Then("products should be sorted by highest price") do
  @products_page = ProductsPage.new
  @products_page.verify_products_sorted
  expect(page).to have_content(ENV['PRODUCT_NAME'])
end

When("I click on the first product") do
  @products_page = ProductsPage.new
  @products_page.choose_first_product
  page.should have_content(ENV['PRODUCT_NAME'])
end

And("I proceed to checkout") do
  @products_page = ProductsPage.new
  @products_page.buy_product
end

And("complete the purchase on the checkout") do
  # Verify and enter checkout details
  @checkout_page = CheckoutPage.new
  @checkout_page.cart_to_purchase
  expect(page).to have_content('Checkout: Your Information')
  @checkout_page.purchase_on_checkout(ENV['FIRSTNAME'], ENV['LASTNAME'], ENV['POSTALCODE'])
end

Then("I should see the order confirmation") do
  # Verify order status
  @checkout_page = CheckoutPage.new
  @checkout_page.checkout_overview
  expect(page).to have_content('Thank you for your order!')
  save_screenshot('order_confirmation.png')
end
