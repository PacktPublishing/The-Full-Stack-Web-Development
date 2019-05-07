<?php
	function numCheck($number){
		if($number < 5){
			throw new Exception('Number must be above 5...');
		}
		return true;
	}

	try{
		numCheck(3);
		echo 'Your number is above 5';
	}

	catch(Exception $e){
		echo 'ERROR: '.$e->getFile().'(Line '.$e->getLine().'): '. $e->getMessage();
	}


	echo 'Hello World';