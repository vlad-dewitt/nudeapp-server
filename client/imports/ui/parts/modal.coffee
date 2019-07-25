import Contact from './contact_us'
import Privacy from './privacy'
import Terms from './terms'



Modal  = class extends Component
  constructor: (props) ->
    super props
    @state = {}



  componentDidMount: =>
    anime
      targets: '#Modal > #layer'
      duration: 100
      easing: 'linear'
      opacity: [0, 1]
    anime
      targets: '#Modal > #window'
      duration: 300
      easing: 'easeInOutQuint'
      scale: [1.2, 1]
      translateY: ['32px', '0px']
      opacity: [0, 1]



  render: =>
    <div id='Modal' className={ @props.classes.Modal }>
      <div id='layer' onClick={ @props.closeModal }></div>
      <div id='window'>
        <div id='close' className='cursor_pointer' onClick={ @props.closeModal }>
          <div id='icon'></div>
        </div>
        <div id='layout'>
          {
            if @props.type is 'contact-us'
              <Contact closeModal={ @props.closeModal }/>
            else if @props.type is 'privacy-policy'
              <Privacy/>
            else if @props.type is 'terms-of-service'
              <Terms/>
          }
        </div>
      </div>
    </div>



Shape = (theme) =>
  Modal:
    position: 'absolute'
    width: '100vw'
    height: '100vh'
    top: 0
    left: 0

    '& > #layer':
      position: 'absolute'
      width: '100vw'
      height: '100vh'
      background: 'rgba(0,0,0,.3)'

    '& > #window':
      position: 'absolute'
      width: '84%'
      height: '76%'
      minHeight: '380px'
      top: '12%'
      left: '8%'
      backgroundColor: 'white'
      borderRadius: '12px'
      padding: '3% 5%'
      boxSizing: 'border-box'

      '& > #close':
        position: 'absolute'
        zIndex: '99'
        width: 44
        height: 44
        top: '4%'
        right: '3%'
        borderRadius: '50%'
        boxShadow: '0 4px 1em rgba(0, 0, 0, 0.15)'
        backgroundColor: 'white'
        transition: '.15s'

        '&:hover':
          transform: 'scale(1.1)'
          transition: '.15s'

        '&:active':
          transform: 'scale(1)'
          transition: '.1s'

        '& > #icon':
          position: 'absolute'
          transform: 'translate3d(-50%, -50%, 0)'
          top: '50%'
          left: '50%'
          width: 12
          height: 12
          background: 'url(/img/icons/close.png) center/contain no-repeat'



export default Hybrid Modal,  Shape
