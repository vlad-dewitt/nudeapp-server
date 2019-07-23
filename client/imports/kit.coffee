import SimpleLoading from '/client/imports/ui/parts/simple_loading'



App = class extends Component
  constructor: (props) ->
    super props
    @state =
      Component: {}
      Component_loaded: no



  componentDidMount: =>
    component = require '/client/imports/ui/parts/welcome'
    @setState
      Component: component.default
      Component_loaded: yes



  render: =>
    <div id='App'>
      {
        if not @props.app.status.loaded or not @state.Component_loaded
          <div id='layout'>
            <SimpleLoading/>
          </div>
        else
          { Component } = @state
          <Route path='/' render={ => <Component/> }/>
      }
    </div>



export default Hybrid App
