Contact  = class extends Component
  constructor: (props) ->
    super props
    @state =
      name: ''
      email: ''
      message: ''



  typeName: (e) =>
    @setState
      name: e.target.value

  typeEmail: (e) =>
    @setState
      email: e.target.value

  typeMessage: (e) =>
    @setState
      message: e.target.value

  submit: =>
    data = @state
    Meteor.call 'sendSupportMessage', data
    @props.closeModal()


  render: =>
    <div id='Contact' className={ @props.classes.Contact }>
      <Helmet>
        <title>NudeApp - Contact Us</title>
      </Helmet>
      <div id='layout'>
        <div id='left'>
          <div id='header'>
            <h1>Get in Touch</h1>
            <div id='line'></div>
          </div>
          <div id='data'>
            <div id='name'>
              <input type='text' placeholder='YOUR NAME' onChange={ @typeName } value={ @state.name }/>
            </div>
            <div id='email'>
              <input type='text' placeholder='VALID EMAIL' onChange={ @typeEmail } value={ @state.email }/>
            </div>
            <div id='message'>
              <textarea placeholder='YOUR MESSAGE' rows='3' onChange={ @typeMessage } value={ @state.message }/>
            </div>
            <button onClick={ @submit }>SEND MESSAGE</button>
          </div>
        </div>
        <div id='right'>
          <div id='map'>
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3152.7986736781795!2d-122.27386978451997!3d37.79475767975583!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x808f80c9678f3893%3A0x35c42e93c1fa7c56!2s255+3rd+St%2C+Oakland%2C+CA+94607%2C+USA!5e0!3m2!1sen!2skz!4v1564016957343!5m2!1sen!2skz" width="100%" height="100%" frameBorder="0" style={{border:0}} allowFullScreen></iframe>
          </div>
          <div id='address'>
            <p>Address: 255 3rd St Oakland CA 94709</p>
          </div>
        </div>
      </div>
    </div>



Shape = (theme) =>
  Contact:
    position: 'relative'
    width: '100%'
    height: '100%'

    '& > #layout':
      position: 'relative'

      '& > #left, & > #right':
        position: 'relative'
        display: 'inline-block'
        verticalAlign: 'middle'
        width: '50%'
        height: '100%'

        '& > #header':
          position: 'relative'

          '& > h1':
            margin: 0
            fontSize: '240%'
            fontWeight: '400'
            marginBottom: '.3em'

          '& > #line':
            width: '60px'
            height: '4px'
            backgroundColor: '#F7CECD'

        '& > #data':
          position: 'absolute'
          transform: 'translate3d(0, -50%, 0)'
          width: '100%'
          top: '50%'
          left: 0

          '& > #name, & > #email':
            position: 'relative'

            '& > input':
              width: '80%'
              fontSize: '80%'
              lineHeight: '24px'
              paddingTop: '25px'
              paddingBottom: '5px'
              background: 'transparent'
              outline: 'none'
              borderRadius: 0
              border: 'none'
              borderBottom: '1px solid black'

              '&::placeholder':
                fontWeight: '500'
                letterSpacing: '2px'

          '& > #message':
            position: 'relative'
            marginBottom: '2em'

            '& > textarea':
              width: '80%'
              fontSize: '80%'
              lineHeight: '24px'
              paddingTop: '25px'
              paddingBottom: '5px'
              background: 'transparent'
              outline: 'none'
              borderRadius: 0
              border: 'none'
              borderBottom: '1px solid black'
              resize: 'none'

              '&::placeholder':
                fontWeight: '500'
                letterSpacing: '2px'

          '& button':
            position: 'relative'
            padding: '13px 32px'
            outline: 'none'
            border: 'none'
            background: 'black'
            color: 'white'
            fontSize: '80%'
            textTransform: 'uppercase'
            letterSpacing: '1px'
            cursor: 'pointer'
            transition: '.2s'
            fontWeight: '600'

            '&:hover':
              transform: 'scale(1.05)'
              transition: '.2s'

            '&:active':
              transform: 'scale(1)'
              transition: '.1s'

      '& > #right':
        width: '48%'
        height: '90%'
        marginRight: '2%'
        borderRadius: '6px'
        backgroundColor: 'rgba(0,0,0,.1)'
        overflow: 'hidden'

        '& > #map':
          position: 'absolute'
          width: '100%'
          height: '100%'
          top: 0
          left: 0

        '& > #address':
          position: 'absolute'
          zIndex: '99'
          width: '100%'
          height: 'auto'
          padding: 8
          boxSizing: 'border-box'
          textAlign: 'center'
          left: 0
          bottom: 0
          backgroundColor: '#CECECE'

          '& > p':
            margin: 0
            color: 'white'
            fontSize: '80%'
            letterSpacing: '.5px'



export default Hybrid Contact, Shape
