var express = require('express');
var router = express.Router();
var request = require('request');

/* GET users listing. */
function User(user){
  this.userId =user.userId;
  this.userAccount = user.userAccount;
  this.userPasswd = user.userPasswd;
  this.userName = user.userName;
  this.userType  = user.userType;
  this.userPhone = user.userPhone;
  this.userEmail = user.userEmail
  this.userStatus = user.userStatus;
  this.userPost = user.userPost;
  this.createdPerson = user.createdPerson;
};

User.get = function get(username,callback){
  if (userName) 
  {
    console.log(userName);
    var requestURL='http://'+global.backendIpAddress+'/train/user/isAccountExist.html?userName='+userName;
    request(requestURL,function(error, response, body)
    // request("http://"+global.testIP+"/1.php", function (error, response, body) 
    {
      if (!error && response.statusCode == 200) {
        console.log('success----');
        var returnBody = JSON.parse(body); 
        console.log(body);
        if (returnBody.isExist =='no') {
          return callback(error,null);
        }else{
            var user = new User({
            name : returnBody.data.userName,

          });
          return callback(error,user);
        }
      }else{
        console.log(response.statusCode);
      }
    });
  }else{
    return callback("error");
  }
}

User.auth = function auth(user,callback){
    var requestURL='http://'+global.backendIpAddress+'/train/user/login.html?userAccount='+user.userAccount+'&userPasswd='+user.userPasswd;
    
    request(requestURL, function (error, response, body)  
    // request("http://"+global.testIP+"/1.php", function (error, response, body) 
    { 
      if (!error && response.statusCode == 200) {
        var returnBody = JSON.parse(body); 
        console.log(body);
        if(returnBody.status=='0'){
          console.log('-------登录成功---------');
          console.log(returnBody.data.userName);
                    user.userName = returnBody.data.userName;
                    user.userId   = returnBody.data.userId;
          return callback(error,null);
        }else{
          console.log(returnBody.msg);
          return callback(error,returnBody.msg);
        }
      }else{
        return callback(error);
    }
  });
}

router.get('/', function(req, res, next) {
  res.send('respond with a resource');
});

module.exports = router;

