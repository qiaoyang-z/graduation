var express = require('express');
var router = express.Router();

/* GET home page. */
console.log("index.js")
router.get('/', function(req, res, next) {
  console.log("这儿");
  res.render('phone/login.html', { title: 'Express' });
});

module.exports = router;
