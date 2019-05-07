var mongoose = require('mongoose');

// Movie Schema
var MovieSchema = mongoose.Schema({
	title: {
		type: String
	},
	plot: {
		type: String
	},
	cover: {
		type: String
	},
	genre: {
		type: String
	},
	actors: {
		type: Array
	},
	releaseDate: {
		type: Date
	}
});

var Movie = module.exports = mongoose.model('Movie', MovieSchema);

module.exports.getMovies = function(callback, limit){
		Movie.find(callback).limit(limit);
}

module.exports.getMovieById = function(id, callback){
	Movie.findById(id, callback);
}