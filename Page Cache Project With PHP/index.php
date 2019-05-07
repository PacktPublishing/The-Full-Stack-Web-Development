<?php
	$mc = new Memcache;
	$mc->connect('127.0.0.1:11211');

	/*
	$mc->add('name','jeff');
	$name = $mc->get('name');
	echo $name;
	*/

	$profile_page = $mc->get('profile_page.php');

	if($profile_page){
		echo $profile_page;
	} else {
		echo 'NOT CACHED...';
		$filename = 'inc/profile_page.php';
		$handle = fopen($filename, "r");
		$contents = fread($handle, filesize($filename));
		//echo $contents;
		$mc->set('profile_page.php', $contents, 0, 30);
		echo $mc->get('profile_page.php');
	}
?>