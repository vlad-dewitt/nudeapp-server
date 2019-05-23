import './kit.styl'



Welcome = class extends Component
  constructor: (props) ->
    super props



  changeWelcomeMessage: =>
    Ambry.call 'changeWelcomeMessage'



  render: =>
    <div id='Welcome'>
      <h1 onClick={ @changeWelcomeMessage }>{ @props.app.config.welcomeMessage }</h1>
    </div>



export default Hybrid Welcome
