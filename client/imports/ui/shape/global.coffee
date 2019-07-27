Theme =
  backgroundColor: 'white'



Stylus = (Theme) =>

  '@global':

    'body':
      position: 'absolute'
      display: 'block'
      width: '100vw'
      height: if IS.mobile() then $(window).height() else '100vh'
      margin: 0
      padding: 0
      overflow: 'hidden'
      'overscroll-behavior': 'none'
      background: 'white'

      '& > #root, & > #root > #App':
        position: 'relative'
        display: 'block'
        width: '100%'
        height: '100%'
        background: => if IS.mobile() then 'url(/img/pictures/bg.jpg) 65%/cover no-repeat' else 'url(/img/pictures/bg.jpg) center/cover no-repeat'

      '& > #root > #App':
        overflowX: => if IS.mobile() then 'hidden' else 'auto'
        overflowY: 'auto'
        '-webkit-overflow-scrolling': 'touch'

        '&:not(.mobile) > #layout':
          minWidth: 960
          minHeight: 640
          overflow: 'hidden'

        '&.mobile > #layout':
          minWidth: '100vw'
          minHeight: '100vh'
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

    '.selectable_text, .selectable_text *':
      userSelect: 'text'
      cursor: 'text'

    '.untouchable':
      pointerEvents: 'none'



export { Theme, Stylus }
