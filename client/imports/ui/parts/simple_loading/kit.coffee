import './kit.styl'

import vector_icons from '/client/imports/ui/shape/vector/icons/kit'



SimpleLoading = class extends Component
  constructor: (props) ->
    super props



  componentDidMount: =>
    anime
      targets: ['#SimpleLoading > #icon > svg']
      scale: [0, 1]
      rotate: [-120, 0]
      baseFrequency: 0
      duration: 800
      endDelay: 200
      loop: yes
      direction: 'alternate'
      easing: 'easeInOutQuint'
      loopComplete: (anim) =>
        if anim.reversed
          config = @props.app.config
          if config
            anim.pause()
            @props.app.setAppLoaded()

    @props.app.getInitConfig()



  render: =>
    <div id='SimpleLoading' className='untouchable cursor_loading'>
      <div id='icon'>{ vector_icons.init_loading }</div>
    </div>



export default outfit SimpleLoading
