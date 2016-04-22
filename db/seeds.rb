User.create!(first_name: "Obi", last_name: "Steps",
              email: "obi@example.com",
              password: "foobar09", password_confirmation: "foobar09",
              confirmed_at: Time.zone.now)

["Coconut Oil", "Sencha Tea", "Gyokuro Tea", "Coconut Water", "Coconut Butter"].each do |prod|
  name = "#{prod}"
  description = "A delicious #{prod}"
  quantity = 2
  price = '4.99'
  Product.create!(name: name, description: description, quantity: quantity, price: price)
end
