Modal  = class extends Component
  constructor: (props) ->
    super props
    @state = {}



  render: =>
    <div id='Modal' className={ @props.classes.Modal }>
      <div id='contact'>
        <div id='header'>
          <h1>Get in Touch</h1>
          <div id='line'></div>
        </div>
        <div id='data'>
          <div id='name'>
            <input type='text'/>
          </div>
          <div id='email'>
            <input type='text'/>
          </div>
          <div id='list'>
            <select>
              <option>Excited</option>
            </select>
          </div>
          <div id='message'>
            <textarea />
          </div>
          <button>SEND MESSAGE</button>
        </div>
      </div>
    </div>



Shape = (theme) =>
  Modal:
    position: 'relative'



export default Hybrid Modal,  Shape
