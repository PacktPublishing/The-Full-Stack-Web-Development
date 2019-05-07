<?php
include 'config/db.php';

// Get Categories
$c_query = "SELECT * FROM categories"; 
$c_result = pg_query($con, $c_query) or die("Cannot execute query: $c_query\n");

if(isset($_POST['submit'])){
	$title = $_POST['title'];
	$body = $_POST['body'];
	$category_id = $_POST['category_id'];

	//$query =  "INSERT INTO articles(title, body, category_id) VALUES('$title', '$body', '$category_id')";
	//$result = pg_query($con, $query);

	$result = pg_query_params("INSERT INTO articles(title, body, category_id) VALUES($1, $2, $3)", array($title, $body, $category_id));

	header("Location:index.php");
}

pg_close($con);
?>

<!DOCTYPE html>
<html>
<head>
	<title>Simple Blog</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/foundation/6.2.3/foundation.css">
</head>
<body>
	<div class="top-bar">
		<div class="top-bar-left">
		<ul class="menu">
		<li class="menu-text">SimpleBlog</li>
		</ul>
		</div>
			<div class="top-bar-right">
				<ul class="menu">
					<li><a href="index.php">Home</a></li>
					<li><a href="new.php">New Post</a></li>
				</ul>
			</div>
	</div>
 
	<div class="callout large primary">
		<div class="row column text-center">
			<h1>Our Blog</h1>
		</div>
	</div>
	<div class="row" id="content">
		<div class="medium-8 columns">
		<h2>New Post</h2>
		<form method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
			<div class="row">
				<div class="medium-12 columns">
					<label>Title
						<input type="text" name="title" placeholder="Title">
					</label>
				</div>
			</div>
			<div class="row">
				<div class="medium-12 columns">
					<label>Body
						<textarea name="body" placeholder="Body"></textarea>
					</label>
				</div>
			</div>
			<div class="row">
				<div class="medium-12 columns">
					<label>Category
						<select name="category_id">
							<option value="0">Select</option>
							<?php while($row = pg_fetch_assoc($c_result)) : ?>
								<option value="<?php echo $row['id']; ?>"><?php echo $row['name']; ?></option>
							<?php endwhile; ?>
						</select>
					</label>
				</div>
			</div>
			<input type="submit" name="submit" value="Submit" class="button">
		</form>
		</div>
		<div class="medium-3 columns" data-sticky-container>
		<div class="sticky" data-sticky data-anchor="content">
		<h4>Categories</h4>
		<ul>
			<?php while($row = pg_fetch_assoc($c_result)) : ?>
				<li><a href="category.php?id=<?php echo $row['id']; ?>"><?php echo $row['name']; ?></a></li>
			<?php endwhile; ?>
		</ul>
		</div>
		</div>
	</div>
</body>
</html>

