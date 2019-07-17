import vector_icons from '/client/imports/ui/shape/vector/icons/kit'



SimpleLoading = class extends Component
  constructor: (props) ->
    super props



  componentDidMount: =>
    anime
      targets: ['#SimpleLoading > #icon > svg']
      scale: 1
      rotate: 0
      baseFrequency: 0
      duration: 800
      endDelay: 200
      loop: yes
      direction: 'alternate'
      easing: 'easeInOutQuint'
      loopComplete: (anim) =>
        if anim.reversed
          config = @props.app.config
          # if config
          #   anim.pause()
          #   Ambry.call 'setAppLoaded'

    Meteor.call 'getInitConfig', null, (err, res) ->
      if err
        console.log err
      else
        Ambry.call 'setInitConfig', res.data



  render: =>
    <div id='SimpleLoading' className={ classNames @props.classes.SimpleLoading, 'untouchable', 'cursor_loading' }>
      <div id='icon'>{ vector_icons.logo }</div>
    </div>



Shape = (theme) =>
  SimpleLoading:
    position: 'relative'
    width: '100%'
    height: '100%'
    background: 'linear-gradient(to bottom left, #E4ADAB, #F8DBC2)'

    '& > #icon':
      position: 'absolute'
      width: 200
      height: 200
      top: '50%'
      left: '50%'
      transform: 'translate3d(-50%, -50%, 0)'



export default Hybrid SimpleLoading, Shape
