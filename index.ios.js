var React = require('react-native');
var {
  View,
  StyleSheet,
  PropTypes,
  NativeModules,
  requireNativeComponent,
  NativeMethodsMixin,
  DeviceEventEmitter,
} = React;

//var { FBLoginManager } = NativeModules;

var SuperStripe = React.createClass({
  statics: {
    //Events: FBLoginManager.Events,
  },

  propTypes: {
    //style: View.propTypes.style,
    //permissions: PropTypes.array, // default: ["public_profile", "email"]
    //loginBehavior: PropTypes.number, // default: Native
    //onLogin: PropTypes.func,
    //onLogout: PropTypes.func,
    //onLoginFound: PropTypes.func,
    //onLoginNotFound: PropTypes.func,
    //onError: PropTypes.func,
    //onCancel: PropTypes.func,
    //onPermissionsMissing: PropTypes.func,
  },

  getInitialState: function(){
    return {
      //credentials: null,
      //subscriptions: [],
    };
  },

  mixins: [NativeMethodsMixin],

  componentWillMount: function(){
    var _this = this;
    //var subscriptions = this.state.subscriptions;
    //
    //// For each event key in FBLoginManager constantsToExport
    //// Create listener and call event handler from props
    //// e.g.  this.props.onError, this.props.onLogin
    //Object.keys(FBLoginManager.Events).forEach(function(event){
    //  subscriptions.push(DeviceEventEmitter.addListener(
    //    FBLoginManager.Events[event],
    //    (eventData) => {
    //      // event handler defined? call it and pass along any event data
    //      var eventHandler = _this.props["on"+event];
    //      eventHandler && eventHandler(eventData);
    //    }
    //  ));
    //})

    // Add listeners to state
    //this.setState({ subscriptions : subscriptions });
  },

  componentWillUnmount: function(){
    //var subscriptions = this.state.subscriptions;
    //subscriptions.forEach(function(subscription){
    //  subscription.remove();
    //});
  },

  componentDidMount: function(){
    var _this = this;
    //FBLoginManager.getCredentials(function(error, data){
    //  if( !_this.isMounted() ) return;
    //  if (!error) {
    //    _this.setState({ credentials : data.credentials });
    //  } else {
    //    _this.setState({ credentials : null });
    //  }
    //});
  },

  render: function() {
    var props = {
      ...this.props,
      style: ([styles.base, this.props.style]),
    };

    return <RCTStripe {...props} />
  },
});

var RCTStripe = requireNativeComponent('RCTStripe', SuperStripe);

var styles = StyleSheet.create({
  base: {
    width: 300,
    height: 300,
  },
});

module.exports = SuperStripe;
