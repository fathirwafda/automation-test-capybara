# This helper for repetition methot that used and can use for global funtion

def scroll_page(horizontal, vertical, obj = self)
    obj.page.execute_script "window.scrollBy(#{horizontal},#{vertical})"
end

def scroll_down(range, obj = self)
    scroll_page(0, range, obj)
end

def scroll_up(range, obj = self)
    scroll_page(0, -range, obj)
end
