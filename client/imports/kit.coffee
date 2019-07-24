import SimpleLoading from '/client/imports/ui/parts/simple_loading'



App = class extends Component
  constructor: (props) ->
    super props
    @state =
      Landing: {}
      Landing_loaded: no



  componentDidMount: =>
    landing = require '/client/imports/ui/parts/landing'
    @setState
      Landing: landing.default
      Landing_loaded: yes



  render: =>
    <div id='App'>
      {
        if not @props.app.status.loaded or not @state.Landing_loaded
          <div id='layout'>
            <SimpleLoading/>
          </div>
        else
          { Landing } = @state
          <Switch>
            <Route path='/' render={ => <Landing/> }/>
            <Redirect from='*' to='/'/>
          </Switch>
      }
    </div>



export default Hybrid App
