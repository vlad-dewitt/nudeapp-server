import './kit.styl'



Welcome = class extends Component
  constructor: (props) ->
    super props



  render: =>
    <div id='Welcome'>
      <h1>{ @props.app.config.welcomeMessage }</h1>
    </div>



export default outfit Welcome
