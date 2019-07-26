# define routes using the Route psuedo component.  Examples:
# Route('/foo', mounts: Foo)                : match the path beginning with /foo and mount component Foo here
# Route('/foo') { Foo(...) }                : display the contents of the block
# Route('/', exact: true, mounts: Home)     : match the exact path / and mount the Home component
# Route('/user/:id/name', mounts: UserName) : path segments beginning with a colon will be captured in the match param
# see the hyper-router gem documentation for more details    
# Route('/', exact: true, mounts: UserIndex) # Seems to work, but no find User becasue there isn't any

    

class AppRouter < HyperComponent
  include Hyperstack::Component  
  include Hyperstack::Router::Helpers
  include Hyperstack::Router

  render (DIV) do
    UL do
      LI { Link( '/about' ) { 'About' }}
      LI { Link( '/' ) { 'Home' } }
      LI { Link( '/user_index') { ' Dialog ' } }
    end
    Route( '/about', mounts: About )
    Route( '/', exact: true, mounts: Home )
    Route( 'user_index', mounts: UserIndex)
  end
end

