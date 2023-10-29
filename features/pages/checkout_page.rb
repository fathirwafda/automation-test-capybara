class CheckoutPage < SitePrism::Page

  element :first_name, '#first-name'
  element :last_name, '#last-name'
  element :post_code, '#postal-code'
  element :finish_button, '#finish'
  element :checkout_button, '#checkout'

  def cart_to_purchase
    checkout_button.click
  end

  def purchase_on_checkout(firstname, lastname, postalcode)
    first_name.set(firstname)
    last_name.set(lastname)
    post_code.set(postalcode)
    click_button 'Continue'
  end

  def checkout_overview
    first_product_name = find('.inventory_item_name', match: :first).text
    raise "Wrong product" unless first_product_name == ENV['PRODUCT_NAME']
    scroll_down(100)
    finish_button.click
  end
end
