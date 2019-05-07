var express = require('express');
var router = express.Router();

// Login Page - GET
router.get('/login', function(req, res){
	res.render('login');
});

// Register Page - GET
router.get('/register', function(req, res){
	res.render('register');
});

module.exports = router;