require "http"

response = HTTP.get("http://localhost:3000/api/first_product")
products = response.parse

first = products["artwork"]["title"]
p first
