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
