Theme =
  backgroundColor: 'white'



Stylus = (Theme) =>

  '@global':

    'body':
      position: 'absolute'
      display: 'block'
      width: '100vw'
      height: '100vh'
      margin: 0
      padding: 0
      overflow: 'hidden'
      background: 'white'

      '& > #root, & > #root > #App':
        position: 'relative'
        display: 'block'
        width: '100%'
        height: '100%'
        background: 'url(/img/pictures/bg.jpg) center/cover no-repeat'

      '& > #root > #App':
        overflow: 'auto'

        '& > #layout':
          minWidth: 960
          minHeight: 640
          overflow: 'hidden'

    '#layout':
      position: 'relative'
      width: '100%'
      height: '100%'

    'div, h1, h2, h3, h4, h5, h6, p, span, img':
      fontFamily: "'Roboto', sans-serif"
      userSelect: 'none'

    'a':
      color: 'white'
      textDecoration: 'none'

    'h1, h2, h3, h4, h5, h6, p':
      cursor: 'default'

    '.hover_zoom:not(.active)':
      transition: '.1s'

      '&:hover':
        transform :'scale(1.1)'
        transition: '.1s'

      '&:active':
        transform: 'scale(1)'
        transition: '.1s'

    '.cursor_pointer, .cursor_pointer *':
      cursor: 'pointer'

    '.cursor_loading, .cursor_loading *':
      cursor: 'progress'

    '.selectable_text':
      userSelect: 'text'
      cursor: 'text'

    '.untouchable':
      pointerEvents: 'none'



export { Theme, Stylus }
