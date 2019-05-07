var express = require('express');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');

var routes = require('./routes/index');
var movies = require('./routes/movies');

var app = express();

app.use(bodyParser.json());

app.use('/', routes);
app.use('/api/v1/movies', movies);

app.listen(3000, function(){
	console.log('Server Running On Port 3000...');
});

