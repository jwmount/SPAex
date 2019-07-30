class About < HyperComponent
	include Hyperstack::Component
	include Hyperstack::Router::Helpers


	render(:div) do
		H2 { 'About' }
	end

end