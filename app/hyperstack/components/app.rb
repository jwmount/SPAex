class App < HyperComponent
  include Hyperstack::Router
  render do
    DIV do
      'App Component'
      # define routes using the Route psuedo component.  Examples:
      # Route('/foo', mounts: Foo)                : match the path beginning with /foo and mount component Foo here
      # Route('/foo') { Foo(...) }                : display the contents of the block
      # Route('/', exact: true, mounts: Home)     : match the exact path / and mount the Home component
      # Route('/user/:id/name', mounts: UserName) : path segments beginning with a colon will be captured in the match param
      # see the hyper-router gem documentation for more details
      Route( '/about', mounts: About )
      Route( '/user_index', exact: true,  mounts: UserIndex )
      Route( '/dialog', exact: true, mounts: UserDialog )
     end

      UL do
        LI { Link( '/about' ) { 'About' }}
        LI { Link( '/user_index') { ' Index ' } }
      end

  end
end
