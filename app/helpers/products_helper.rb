module ProductsHelper
	def formatted_price(price)
		return number_to_currency(price,locale: :hi)
	end
end
