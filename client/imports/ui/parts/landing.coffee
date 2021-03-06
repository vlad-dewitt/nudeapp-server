import vector_icons from '/client/imports/ui/shape/vector/icons/kit'
import Modal from '/client/imports/ui/parts/modal'



Landing = class extends Component
  constructor: (props) ->
    super props
    @state =
      ios_url: @props.app.config.ios_url
      android_url: @props.app.config.android_url
      video_available: @props.app.config.video_available
      playing_video: no



  componentDidMount: =>
    anime
      targets: '#Landing'
      opacity: [0, 1]
      duration: 1000
      easing: 'easeInOutQuint'



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

  play_video: =>
    @setState
      playing_video: yes
    , =>
      $('#nude_intro')[0].play()



  render: =>
    <div id='Landing' className={ @props.classes.Landing }>
      <Helmet>
        <title>NudeApp</title>
      </Helmet>
      <div id='header'>
        <div id='left'>
          <div id='logo'>{ vector_icons.logo }</div>
        </div>
        <div id='right'>
          <Link to='/contact-us'>
            <button className='cursor_pointer'>CONTACT</button>
          </Link>
        </div>
      </div>
      <div id='content'>
        <div id='left'>
          <div id='vidos'>
            <video id='nude_intro' width="100%" height="100%" controls={ no } poster='/img/pictures/poster.jpg'>
              <source src="/img/videos/nude_intro.mp4" type="video/mp4"/>
            </video>
            {
              if @state.video_available
                <div id='play' className={ classNames 'cursor_pointer', 'hidden': @state.playing_video } onClick={ @play_video }></div>
            }
          </div>
        </div>
        <div id='right'>
          <h1>A Secure Vault for All Your<br/> Naughty Photos</h1>
          <p>Download the sexiest app ever today</p>
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
              <h2>Break-in<br/> Alerts</h2>
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
          <div id='bottom'>
            <a href={ @state.ios_url } target='_blank' className={ if @state.ios_url.length is 0 then 'inactive' }>
              <div id='left' className='cursor_pointer'>
                <div id='icon'></div>
                <h2>App Store</h2>
              </div>
            </a>
            <a href={ @state.android_url } target='_blank' className={ if @state.android_url.length is 0 then 'inactive' }>
              <div id='right' className='cursor_pointer'>
                <div id='icon'></div>
                <h2>Google Play</h2>
              </div>
            </a>
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
        <div id='left'>
          <h3>{ "© #{ new Date().getFullYear() } Nude | A HEXA Product. All rights reserved." }</h3>
        </div>
        <div id='center'>
          <div id='face' className='cursor_pointer'>
            <div id='icon'></div>
          </div>
          <div id='twit' className='cursor_pointer'>
            <div id='icon'></div>
          </div>
        </div>
        <div id='right'>
          <Link to='/privacy-policy'>
            <p className='cursor_pointer'>Privacy</p>
          </Link>
          <Link to='/terms-of-service'>
            <p className='cursor_pointer'>Terms & Conditions</p>
          </Link>
        </div>
      </div>
      {
        if @props.modal
          <Modal type={ @props.modal } closeModal={ @closeModal }/>
      }
    </div>


Shape = (theme) =>
  Landing:
    position: 'relative'
    width: '100%'
    height: '100%'
    opacity: 0

    '& > #header':
      position: 'relative'
      padding: '1.5em 6em 1.5em'
      boxSizing: 'border-box'

      '& > #left, & > #right':
        position: 'relative'
        display: 'inline-block'
        verticalAlign: 'middle'
        width: '50%'

        '& > #logo':
          position: 'relative'
          width: '118px'

        '& button':
          position: 'relative'
          padding: '10px 32px'
          outline: 'none'
          border: 'solid 1px white'
          borderRadius: '32px'
          background: 'transparent'
          color: 'white'
          fontSize: '100%'
          textTransform: 'uppercase'
          letterSpacing: '1px'
          cursor: 'pointer'
          transition: '.2s'

          '&:hover':
            transform: 'scale(1.05)'
            transition: '.2s'

          '&:active':
            transform: 'scale(1)'
            transition: '.1s'

      '& > #right':
        textAlign: 'right'

    '& > #content':
      position: 'absolute'
      transform: 'translate3d(0, -50%, 0)'
      width: '100%'
      top: '45%'
      padding: '0 3em'
      boxSizing: 'border-box'
      marginTop: '2em'

      '& > #left, & > #right':
        position: 'relative'
        display: 'inline-block'
        verticalAlign: 'middle'
        width: '50%'
        color: 'white'

        '& > #vidos':
          width: '100%'
          height: '46vh'
          minHeight: '20em'
          borderRadius: '4px'
          backgroundColor: 'rgba(255,255,255, .2)'
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

            '&:hover':
              transform: 'translate3d(-50%, -50%, 0) scale(1.05)'
              transition: '.2s'

            '&:active':
              transform: 'translate3d(-50%, -50%, 0) scale(1)'
              transition: '.1s'

      '& > #left':
        padding: '0 2%'
        boxSizing: 'border-box'

      '& > #right':
        position: 'relative'
        paddingLeft: '2em'
        boxSizing: 'border-box'

        '& > h1':
          margin: '0'
          fontSize: '280%'
          letterSpacing: '2px'
          fontWeight: '500'
          letterSpacing: '.5px'

        '& > p':
          fontSize: '110%'
          paddingLeft: '1em'
          fontWeight: '100'
          letterSpacing: '.5px'

        '& > #left, & > #center, & > #right':
          position: 'relative'
          display: 'inline-block'
          verticalAlign: 'middle'
          width: 'calc(100% / 3)'

          '& > #dirka':
            width: '54px'
            height: '54px'
            borderRadius: '50%'
            backgroundColor: 'white'
            position: 'relative'
            display: 'inline-block'
            verticalAlign: 'middle'
            marginRight: '1em'
            boxShadow: '0 4px 1em rgba(0, 0, 0, 0.15)'

            '& > #icon':
              position: 'absolute'
              transform: 'translate3d(-50%, -50%, 0)'
              top: '50%'
              left: '50%'
              width: 26
              height: 26
              background: 'url(/img/icons/privacy.png) center/contain no-repeat'

          '& > #text':
            position: 'relative'
            display: 'inline-block'
            verticalAlign: 'middle'
            width: '50%'

            '& > h2':
              fontSize: '100%'
              fontWeight: '100'

        '& > #center > #dirka':

          '& > #icon':
            background: 'url(/img/icons/alerts.png) center/contain no-repeat !important'

        '& > #right > #dirka':

          '& > #icon':
            background: 'url(/img/icons/detect.png) center/contain no-repeat !important'

        '& > #bottom':
          position: 'relative'
          left: -10
          textAlign: 'center'
          marginTop: '2em'

          '& #left, #right':
            position: 'relative'
            display: 'inline-block'
            verticalAlign: 'middle'
            borderRadius: '40px'
            width: '46%'
            height: '70px'
            backgroundColor: 'rgba(255, 255, 255, .3)'
            cursor: 'pointer'
            transition: '.2s'

            '&:hover':
              transform: 'scale(1.05)'
              transition: '.2s'

            '&:active':
              transform: 'scale(1)'
              transition: '.1s'

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
              paddingLeft: '20px'
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

      '& > #footer':
        position: 'relative'
        marginTop: '3em'
        textAlign: 'center'

        '& > .partner':
          position: 'relative'
          display: 'inline-block'
          verticalAlign: 'middle'
          width: 'auto'
          height: 'auto'
          margin: '0 18px'

          '& > img':
            height: 26

    '& > #footer':
      position: 'absolute'
      width: '100%'
      bottom: 0
      textAlign: 'center'
      marginBottom: '2em'
      paddingTop: '1em'

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
        display: 'inline-block'
        verticalAlign: 'middle'
        width: '30%'

        '& > h3':
          margin: '0'
          fontSize: '80%'
          fontWeight: '400'
          color: 'white'
          position: 'relative'
          display: 'inline-block'
          paddingRight: '2em'

      '& > #center':
        textAlign: 'center'

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

      '& > #right':

        '& > a':
          display: 'inline-block'
          marginRight: '1.5em'

          '& > p':
            fontSize: '80%'
            textDecoration: 'underline'
            letterSpacing: '.5px'
            transition: '.2s'

            '&:hover':
              opacity: '.8'
              textDecoration: 'none'
              transition: '.2s'

            '&:active':
              transform: 'scale(1)'
              transition: '.1s'



export default Hybrid Landing, Shape
