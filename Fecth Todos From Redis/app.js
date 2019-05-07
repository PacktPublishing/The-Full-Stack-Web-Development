var express = require('express');
var path =  require('path');
var bodyParser = require('body-parser');
var redis = require('redis');

var app = express();

// Redis Client
var client = redis.createClient();

client.on('connect', function(){
	console.log('Connected To Redis...');
});

// View Engine
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', function(req, res){
	var title = 'Redis Todos';

	client.lrange('todos', 0, -1, function(err, reply){
		res.render('index', {
			title: title,
			todos: reply
		});
	});
});

app.listen(3000, function(){
	console.log('Server Started On Port 3000...');
});

module.exports = app;