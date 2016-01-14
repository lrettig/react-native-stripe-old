'use strict';

var {
  StyleSheet,
  Image,
  Text,
  View,
} = React;

var SuperStripe = require('react-native-stripe');

//var FBLogin = require('react-native-facebook-login');
//var FBLoginMock = require('./facebook/FBLoginMock.js');
//var FBLoginManager = require('NativeModules').FBLoginManager;

//var FB_PHOTO_WIDTH = 200;

var Login = React.createClass({
  getInitialState: function(){
    return {
      //user: null,
    };
  },

  render: function() {
    var _this = this;
    //var user = this.state.user;

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
