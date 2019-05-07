var express = require('express');
var router = express.Router();

// Login Page - GET
router.get('/login', function(req, res){
	res.send('LOGIN');
});

// Register Page - GET
router.get('/register', function(req, res){
	res.send('REGISTER');
});

module.exports = router;