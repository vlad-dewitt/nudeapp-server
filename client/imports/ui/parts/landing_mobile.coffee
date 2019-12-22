import vector_icons from '/client/imports/ui/shape/vector/icons/kit'
import Modal from '/client/imports/ui/parts/modal'



LandingMobile = class extends Component
  constructor: (props) ->
    super props
    @state =
      menu: no
      ios_url: @props.app.config.ios_url
      android_url: @props.app.config.android_url
      video_available: @props.app.config.video_available
      playing_video: no



  componentDidMount: =>
    anime
      targets: '#LandingMobile'
      opacity: [0, 1]
      duration: 1000
      easing: 'easeInOutQuint'



  showMenu: =>
    if not @state.menu
      @setState
        menu: yes
      , =>
        $('#App').animate
          scrollTop: 0
        , 200
        $('#App').css
          overflowY: 'hidden'
        anime
          targets: '#Menu > #window'
          duration: 300
          easing: 'easeInOutQuint'
          translateX: ['-100%', '0%']

  closeMenu: (callback) =>
    if @state.menu
      anime
        targets: '#Menu > #window'
        duration: 300
        easing: 'easeInOutQuint'
        translateX: ['0%', '-100%']
        complete: =>
          $('#App').css
            overflowY: 'auto'
          @setState
            menu: no
          if callback
            callback()

  linkFromMenu: (link, e) =>
    e.preventDefault()
    @closeMenu =>
      @props.history.push "/#{ link }"

  play_video: =>
    @setState
      playing_video: yes
    , =>
      $('#nude_intro')[0].play()

  closeModal: =>
    anime
      targets: '#Modal > #window'
      duration: 300
      easing: 'easeInOutQuint'
      scale: 1.2
      translateY: '32px'
      opacity: 0
    anime
      targets: '#Modal > #layer'
      duration: 200
      delay: 150
      easing: 'linear'
      opacity: 0
      complete: =>
        $('#App').css
          overflowY: 'auto'
        @props.history.push '/'



  render: =>
    <div id='LandingMobile' className={ @props.classes.LandingMobile }>
      <Helmet>
        <title>NudeApp</title>
      </Helmet>
      <div id='header'>
        <div id='menu' onClick={ @showMenu }></div>
        <div id='center'>
          <div id='logo'>{ vector_icons.logo }</div>
        </div>
      </div>
      <div id='content'>
        <div id='vidos'>
          <video id='nude_intro' width="100%" height="100%" controls={ no } poster='/img/pictures/poster.jpg'>
            <source src="/img/videos/nude_intro.mp4" type="video/mp4"/>
          </video>
          {
            if @state.video_available
              <div id='play' className={ classNames 'cursor_pointer', 'hidden': @state.playing_video } onClick={ @play_video }></div>
          }
        </div>
        <div id='bottom'>
          <h1>The Sexiest App Ever.</h1>
          <div id='buttons'>
            <a href={ @state.ios_url } target='_blank' className={ if @state.ios_url.length is 0 then 'inactive' }>
              <div id='left'>
                <div id='icon'></div>
                <h2>App Store</h2>
              </div>
            </a>
            <a href={ @state.android_url } target='_blank' className={ if @state.android_url.length is 0 then 'inactive' }>
              <div id='right'>
                <div id='icon'></div>
                <h2>Google Play</h2>
              </div>
            </a>
          </div>
          <div id='left'>
           <div id='dirka'>
            <div id='icon'></div>
           </div>
           <div id='text'>
            <h2>Complete Privacy</h2>
           </div>
          </div>
          <div id='center'>
            <div id='dirka'>
             <div id='icon'></div>
            </div>
            <div id='text'>
              <h2>Break-in Alerts</h2>
            </div>
          </div>
          <div id='right'>
            <div id='dirka'>
             <div id='icon'></div>
            </div>
            <div id='text'>
              <h2>Auto Nude Detection</h2>
            </div>
          </div>
        </div>
        <div id='footer'>
          <div className='partner'>
            <img src='/img/pictures/par_1.png'/>
          </div>
          <div className='partner'>
            <img src='/img/pictures/par_2.png'/>
          </div>
          <div className='partner'>
            <img src='/img/pictures/par_3.png'/>
          </div>
          <div className='partner'>
            <img src='/img/pictures/par_4.png'/>
          </div>
          <div className='partner'>
            <img src='/img/pictures/par_5.png'/>
          </div>
          <div className='partner'>
            <img src='/img/pictures/par_6.png'/>
          </div>
        </div>
      </div>
      <div id='footer'>
        <div id='center'>
          <div id='face'>
            <div id='icon'></div>
          </div>
          <div id='twit'>
            <div id='icon'></div>
          </div>
        </div>
        <div id='left'>
          <h3>{ "© #{ new Date().getFullYear() } Nude | A HEXA Product." }<br/>All rights reserved.</h3>
        </div>
      </div>
      {
        if @state.menu
          <div id='Menu'>
            <div id='window'>
              <div id='close' onClick={ @closeMenu.bind this, null }>
                <div id='icon'></div>
              </div>
              <div id='layout'>
                <div id='list'>
                  <Link to='/privacy-policy' onClick={ @linkFromMenu.bind this, 'privacy-policy' }>
                    <p>Privacy</p>
                  </Link>
                  <Link to='/terms-of-service' onClick={ @linkFromMenu.bind this, 'terms-of-service' }>
                    <p>Terms & Conditions</p>
                  </Link>
                  <Link to='/contact-us' onClick={ @linkFromMenu.bind this, 'contact-us' }>
                    <p>Contact Us</p>
                  </Link>
                </div>
              </div>
            </div>
          </div>
      }
      {
        if @props.modal
          <Modal type={ @props.modal } closeModal={ @closeModal }/>
      }
    </div>


Shape = (theme) =>
  LandingMobile:
    position: 'relative'
    width: '100%'
    height: 'auto'
    opacity: 0

    '& > #header':
      position: 'relative'
      padding: '18px'
      boxSizing: 'border-box'

      '& > #menu':
        position: 'absolute'
        zIndex: '2'
        transform: 'translate3d(0, -50%, 0)'
        width: 28
        height: 28
        top: '50%'
        left: 26
        background: 'url(/img/icons/menu.png) center/contain no-repeat'
        transition: '.1s'

        '&:active':
          transform: 'translate3d(0, -50%, 0) scale(.9)'
          transition: '.1s'

      '& > #center':
        position: 'relative'
        width: '100%'
        textAlign: 'center'

        '& > #logo':
          position: 'relative'
          display: 'inline-block'
          width: '118px'

    '& > #content':
      position: 'relative'
      width: '100%'
      height: 'auto'
      padding: '0 3em'
      boxSizing: 'border-box'

      '& > #vidos':
        position: 'relative'
        width: '160%'
        height: 260
        left: '-30%'
        backgroundColor: 'rgba(255,255,255, .2)'
        borderRadius: '4px'
        overflow: 'hidden'

        '& > video':
          objectFit: 'cover'

        '& > #play':
          background: 'url(/img/icons/play_video.png) center/contain no-repeat'
          width: 72
          height: 72
          position: 'absolute'
          transform: 'translate3d(-50%, -50%, 0)'
          top: '50%'
          left: '50%'
          transition: '.2s'

          '&.hidden':
            transform: 'translate3d(-50%, -50%, 0) scale(.6) !important'
            opacity: 0
            pointerEvents: 'none'
            transition: '.3s'

          '&:active':
            transform: 'translate3d(-50%, -50%, 0) scale(.9)'
            transition: '.1s'

      '& > #bottom':
        position: 'relative'
        width: '100%'
        color: 'white'
        padding: '2em 0'
        boxSizing: 'border-box'
        textAlign: 'center'

        '& > h1':
          margin: '0'
          fontSize: '160%'
          letterSpacing: '2px'
          fontWeight: '300'
          letterSpacing: '.5px'

        '& > #buttons':
          position: 'relative'
          textAlign: 'center'
          margin: '2em 0 4em'

          '& #left, #right':
            position: 'relative'
            display: 'inline-block'
            verticalAlign: 'middle'
            borderRadius: '40px'
            width: '100%'
            height: '70px'
            backgroundColor: 'rgba(255, 255, 255, .3)'
            transition: '.2s'

            '&:first-child':
              marginBottom: '1em'

            '&:active':
              transform: 'scale(.9)'
              transition: '.1s'

            '&.inactive':
              opacity: '.5'
              pointerEvents: 'none'

            '& > #icon':
              position: 'absolute'
              transform: 'translate3d(0%, -50%, 0)'
              top: '50%'
              left: '15%'
              background: 'url(/img/icons/google_play.png) center/contain no-repeat'
              width: 32
              height: 32

            '& > h2':
              fontWeight: '500'
              paddingLeft: '26px'
              letterSpacing: '.5px'

            '& > p':
              position: 'absolute'
              transform: 'translate3d(-50%, 0, 0)'
              letterSpacing: '.5px'
              top: '90%'
              left: '50%'
              textTransform: 'uppercase'
              fontSize: '90%'

          '& #left':
            marginRight: '5%'

            '& > #icon':
              background: 'url(/img/icons/apple.png) center/contain no-repeat !important'

          '& > a.inactive':
            cursor: 'default'
            pointerEvents: 'none'

            '& > div':
              opacity: '.5'
              pointerEvents: 'none'

        '& > #left, & > #center, & > #right':
          position: 'relative'
          width: '100%'
          textAlign: 'left'
          marginBottom: 18

          '& > #dirka':
            width: 60
            height: 60
            borderRadius: '50%'
            backgroundColor: 'white'
            position: 'relative'
            display: 'inline-block'
            verticalAlign: 'middle'
            marginRight: 18
            boxShadow: '0 4px 1em rgba(0, 0, 0, 0.15)'

            '& > #icon':
              position: 'absolute'
              transform: 'translate3d(-50%, -50%, 0)'
              top: '50%'
              left: '50%'
              width: 28
              height: 28
              background: 'url(/img/icons/privacy.png) center/contain no-repeat'

          '& > #text':
            position: 'relative'
            display: 'inline-block'
            verticalAlign: 'middle'
            width: 'calc(100% - 78px)'

            '& > h2':
              fontSize: '120%'
              fontWeight: '200'

        '& > #center > #dirka':

          '& > #icon':
            background: 'url(/img/icons/alerts.png) center/contain no-repeat !important'

        '& > #right > #dirka':

          '& > #icon':
            background: 'url(/img/icons/detect.png) center/contain no-repeat !important'

      '& > #footer':
        position: 'relative'
        margin: '2em 0'
        textAlign: 'center'

        '& > .partner':
          position: 'relative'
          width: 'auto'
          height: 'auto'
          margin: '15px 0'

          '& > img':
            height: 26

    '& > #footer':
      position: 'relative'
      width: '100%'
      textAlign: 'center'
      marginBottom: '2em'
      paddingTop: '2em'

      '&:before':
        content: '""'
        position: 'absolute'
        width: '90%'
        margin: '0 5%'
        opacity: .7
        height: '1px'
        backgroundColor: '#C9C9C9'
        boxShadow: '0 1px 3em rgba(0, 0, 0, 0.5)'
        top: 0
        left: 0

      '& > #left, & > #center, & > #right':
        position: 'relative'
        display: 'block'
        textAlign: 'center'

        '& > h3':
          margin: '0'
          fontSize: '80%'
          fontWeight: '400'
          color: 'white'
          position: 'relative'

      '& > #center':
        textAlign: 'center'
        marginBottom: '1em'

        '& > #face, & > #twit':
          position: 'relative'
          display: 'inline-block'
          verticalAlign: 'middle'
          width: 'auto'
          textAlign: 'center'

          '& > #icon':
            background: 'url(/img/icons/facebook.png) center/contain no-repeat'
            width: 16
            height: 16
            transition: '.2s'

            '&:hover':
              transform: 'scale(1.15)'
              transition: '.2s'

            '&:active':
              transform: 'scale(1)'
              transition: '.1s'

        '& > #twit > #icon':
          background: 'url(/img/icons/twitter.png) center/contain no-repeat !important'
          marginLeft: '1em'

    '& > #Menu':
      position: 'absolute'
      zIndex: '999'
      width: '100vw'
      height: '100vh'
      top: 0
      left: 0

      '& > #window':
        position: 'absolute'
        transform: 'translate3d(-100%, 0, 0)'
        width: '100%'
        height: '100%'
        top: 0
        left: 0
        background: 'linear-gradient(to bottom left, #E5B0AD, #F9DAC3)'
        padding: '3% 5%'
        boxSizing: 'border-box'

        '& > #close':
          position: 'absolute'
          zIndex: '99'
          width: 44
          height: 44
          top: '4%'
          left: '3%'
          transition: '.15s'

          '&:active':
            transform: 'scale(.9)'
            transition: '.1s'

          '& > #icon':
            position: 'absolute'
            transform: 'translate3d(-50%, -50%, 0)'
            top: '50%'
            left: '50%'
            width: 24
            height: 24
            background: 'url(/img/icons/cancel.png) center/contain no-repeat'

        '& > #layout':

          '& > #list':
            position: 'absolute'
            transform: 'translate3d(0, -50%, 0)'
            top: '45%'
            width: '100%'
            height: 'auto'
            textAlign: 'center'

            '& > a':

              '&:last-child':
                marginRight: 0

              '& > p':
                marginBottom: '2em 0'
                fontSize: '140%'
                letterSpacing: '1px'
                fontWeight: '200'
                transition: '.2s'

                '&:active':
                  transform: 'scale(1)'
                  transition: '.1s'



export default Hybrid LandingMobile, Shape
