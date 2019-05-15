import { SimpleLoading } from '/client/imports/ui/parts/kit'
import { Welcome } from '/client/imports/ui/parts/kit'



App = class extends Component
  constructor: (props) ->
    super props



  render: =>
    <div id='App'>
      {
        if not @props.app.status.loaded
          <div id='layout'>
            <SimpleLoading/>
          </div>
        else
          <Route path="/" render={ => <Welcome/> }/>
      }
    </div>



export default outfit App
