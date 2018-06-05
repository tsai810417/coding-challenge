# React
### React Lifecycle Methods
- componentWillMount: there's no component to play with yet, so you can't do anything involving the DOM.
  - Most common use case: app configuration in your root component.
  - Do not call setState, use default state instead

- componentDidMount: where you can do things to the component, e.g draw on ```<canvas>```, add event listeners, do all the setup you couldn't do without a DOM and start getting all the data you need.
  - Most common use case: starting AJAX calls to load in data for the component
  - Can call setState

- componentWillReceiveProps: where you have access to both the next props(via nextProps) and current props(via this.props). You will check which props will change, and then if the props will change in a way that is significant, act on it.
  - Most common use case: acting on particular prop changes to trigger state transitions
  - Can call setState

- shouldComponentUpdate: nextProps as first argument and nextState is the second. This is returning a boolean--an answer to "should I re-render?".
  - Most common use case: controlling exactly when your component will re-render
  - Can NOT call setState

- componentWillUpdate: Functionally same as componentWillReceiveProps, but not allowed to call this.setState.
  - Most common use case: used instead of componentWillReceiveProps on a component that also has shouldComponentUpdate(but no access to previous props)
  - Can NOT call setState

- componentDidUpdate: You can do the same stuff did in componentDidMount--reset the layout or redraw on canvas.
  - Most common use case: update the DOM in response to props or state changes
  - Can call setState

- componentWillUnmount: Your component is going to go away, but before it goes, it asks if you have last-minute requests e.g cancel outgoing network requests or remove event listeners associated with this component.
  - Most common use case: clean up any leftover deris from the component
  - Can NOT call setState

  
