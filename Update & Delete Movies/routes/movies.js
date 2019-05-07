var express = require('express');
var router = express.Router();

var Movie = require('../models/Movie');

// List Movies
router.get('/', function(req, res, next){
	Movie.getMovies(function(err, movies){
		if(err){
			res.send(err);
		}
		res.json(movies);
	},10);
});

// Single Movie
router.get('/:id', function(req, res, next){
	Movie.getMovieById([req.params.id], function(err, movie){
		if(err){
			res.send(err);
		}
		res.json(movie);
	});
});

// Add Movie
router.post('/', function(req, res, next){
	var movie = req.body;
	var newMovie = new Movie(movie);

	newMovie.save(function(err, movie){
		if(err){
			res.send(err);
		}
		res.json(movie);
	});
});

// Update Movie
router.put('/:id', function(req, res, next){
	var query = {_id: [req.params.id]};
	var body = req.body;
	Movie.update(query, {$set:body}, {}, function(err, movie){
		if(err){
			res.send(err);
		}
		res.json(movie);
	});
});

// Delete Movie
router.delete('/:id', function(req, res, next){
	var query = {_id: [req.params.id]};
	Movie.remove(query, function(err){
		if(err){
			res.send(err);
		}
		res.json({
			msg:"Success"
		});
	});
});

module.exports = router;