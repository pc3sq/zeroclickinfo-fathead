require 'nokogiri'

page = Nokogiri::HTML(open("download/rspec-expectations"))

# =============
## DRIVER CODE
# =============

matchers_section = page.css("#readme > article > h2:nth-child(16)")[0]

# p page.css("#readme > article > h2:nth-child(16)")[0].next_element.text

def scrape_rspec_matchers (matchers_section)
	current_elem = matchers_section.next_element

	headings = []
	code_samples = []

	until current_elem.name == "h4"
		headings << current_elem.text.strip if current_elem.name == "h3"

		code_samples << current_elem.child.text if current_elem.name == "div"

		current_elem = current_elem.next_element
	end 

	p headings.zip(code_samples)

end