//localStorage.setItem('name', 'John Doe');
//console.log(localStorage.getItem('person'));

//sessionStorage.setItem('greeting', 'Hello World');
//console.log(sessionStorage.getItem('greet'));

/*
document.cookie = "name:John Doe";
var x = document.cookie;
console.log(x);
*/

// Create Database
var mydb = openDatabase('testdb', '0.1', 'Test Database', 1024 * 1024);

// Create Table
mydb.transaction(function(t){
	t.executeSql('CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY, name VARCHAR(50))');
});

// Insert Record
mydb.transaction(function(t){
	t.executeSql("INSERT INTO users (name) VALUES (?)", ['John Doe']);
});