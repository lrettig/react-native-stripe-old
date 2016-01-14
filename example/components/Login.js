'use strict';

var {
  StyleSheet,
  Image,
  Text,
  View,
} = React;

var SuperStripe = require('react-native-stripe');
var StripeManager = require('NativeModules').StripeManager;

var Login = React.createClass({
  getInitialState: function(){
    return {
      //user: null,
    };
  },

  render: function() {
    var _this = this;

    return (
      <View style={styles.loginContainer}>
        <SuperStripe/>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  loginContainer: {
    marginTop: 10,

    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
});

module.exports = Login;
