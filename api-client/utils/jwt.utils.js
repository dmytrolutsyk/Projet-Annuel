//Imports
const {jwt} = require('../config');

const {JWT_SIGN_SECRET} = require('../config');

//Exported functions
module.exports = {
    generateTokenForUser: function(userData) {
        return jwt.sign({
            userId: userData._id,
            username: userData.username,
            password: userData.password
        },
        JWT_SIGN_SECRET,
        {
            expiresIn: '24h'
        })
    },
    
    getUserId: function(authorization) {
      var userId = -1;
      var token = module.exports.parseAuthorization(authorization);
      if(token != null) {
        try {
          var jwtToken = jwt.verify(token, JWT_SIGN_SECRET);
          if(jwtToken != null)
            userId = jwtToken.userId;
        } catch(err) { }
      }
      return userId;
    }
}