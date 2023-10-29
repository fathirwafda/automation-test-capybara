# Products Page

class ProductsPage < SitePrism::Page
  path = "/inventory.html"
  set_url(ENV['BASE_URL'] + path)

  element :products_sort_price, '.product_sort_container'
  element :hilo_option, :xpath, "//option[@value='hilo']"
  element :highest_item_price, '#item_5_title_link'
  element :trolley_icon, '#shopping_cart_container'
  
  def click_sort
    wait_until_products_sort_price_visible(wait: 5)
    products_sort_price.click
    wait_until_hilo_option_visible(wait: 5)
    hilo_option.click
  end

  def verify_products_sorted
    product_prices = all('.inventory_item_price').map(&:text)
    sorted_product_prices = product_prices.sort_by { |price| -price[1..-1].to_f }
    raise "The choosen product prices is not the higher" unless product_prices == sorted_product_prices
  end

  def choose_first_product
    first_product_name = find('.inventory_item_name', match: :first).text
    puts "The product has choosen is "+first_product_name
    first('.inventory_item_img').click
  end

  def buy_product
    # Buy the product
    click_button 'Add to cart'
    trolley_icon.click
  end
end
