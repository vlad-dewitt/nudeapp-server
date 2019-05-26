Welcome = class extends Component
  constructor: (props) ->
    super props



  changeWelcomeMessage: =>
    Ambry.call 'changeWelcomeMessage'



  render: =>
    <div id='Welcome' className={ @props.classes.Welcome }>
      <h1 onClick={ @changeWelcomeMessage }>{ @props.app.config.welcomeMessage }</h1>
    </div>



Shape =
  Welcome:
    position: 'relative'
    width: '100%'
    height: '100%'
    background: 'white'

    '& h1':
      position: 'absolute'
      transform: 'translate3d(-50%, -50%, 0)'
      top: '50%'
      left: '50%'
      margin: '0 auto'
      fontSize: '800%'
      color: '#6C83AB'



export default Hybrid Welcome, Shape
