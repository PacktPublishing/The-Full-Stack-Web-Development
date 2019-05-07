const MongoClient = require('mongodb').MongoClient;

// Connection url
const url = 'mongodb://localhost:27017/myproject';

MongoClient.connect(url, function(err, db){
	if(err){
		return console.dir(err);
	}
	console.log('Connected to mongodb');

	/*
	InsertDocument(db, function(){
		db.close();
	});
	*/

	/*
	InsertDocuments(db, function(){
		db.close();
	});
	*/
	FindDocuments(db, function(){
		db.close();
	});


});

// Insert Single Doc
const InsertDocument = function(db, callback){
	// Get Collection
	const collection = db.collection('users');
	// Insert Docs
	collection.insert({
		name: 'Brad Traversy',
		email: 'brad@test.com'
	}, function(err, result){
		if(err){
			return console.dir(err);
		}
		console.log('Inserted Document');
		console.log(result);
		callback(result);
	});
}

// Insert Multiple Docs
const InsertDocuments = function(db, callback){
	// Get Collection
	const collection = db.collection('users');
	collection.insertMany([
		{
			name:'John Doe',
			email: 'john@test.com'
		},
		{
			name:'Sam Smith',
			email: 'ssmith@test.com'
		},
		{
			name:'Jose Gomez',
			email: 'jgomez@test.com'
		}
	],
	function(err, result){
		if(err){
			return console.dir(err);
		}
		console.log('Inserted '+result.ops.length+' documents');
		callback(result);
	});
}

const FindDocuments = function(db, callback){
	// Get Collection
	const collection = db.collection('users');

	collection.find({}).toArray(function(err, docs){
		if(err){
			return console.dir(err);
		}
		console.log('Found the following records');
		console.log(docs);
		callback(docs);
	});
}