<?php
include 'config/db.php';

// Get Articles
$a_query = "SELECT * FROM articles"; 
$a_result = pg_query($con, $a_query) or die("Cannot execute query: $a_query\n");

pg_close($con);
?>

<?php while($row = pg_fetch_assoc($a_result)) : ?>
	<div class="blog-post">
	<h3><?php echo $row['title']; ?></h3>
	<p><?php echo $row['body']; ?></p>
	</div>
<?php endwhile; ?>