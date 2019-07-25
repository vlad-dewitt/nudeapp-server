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
        # if not @state.Landing_loaded
          <div id='layout'>
            <SimpleLoading/>
          </div>
        else
          { Landing } = @state
          <Switch>
            <Route exact path='/' render={ => <Landing/> }/>
            <Route path='/contact-us' render={ => <Landing modal='contact-us'/> }/>
            <Route path='/terms-of-service' render={ => <Landing modal='terms-of-service'/> }/>
            <Route path='/privacy-policy' render={ => <Landing modal='privacy-policy'/> }/>
            <Redirect from='*' to='/'/>
          </Switch>
      }
    </div>



export default Hybrid App
