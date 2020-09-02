require "http"
system "clear"

response = HTTP.get("http://localhost:3000/api/first_product")
products = response.parse

first = products["first_artwork"]["title"]
p first
