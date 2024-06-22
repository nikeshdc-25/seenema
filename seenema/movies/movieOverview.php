<?php
$host = "localhost";
$username = "root";
$password = "";
$dbname = "seenema";
$conn = new mysqli($host, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$movieTitle = isset($_GET['title']) ? $_GET['title'] : '';

if (empty($movieTitle)) {
    echo "<script>window.location.reload();</script>";
    exit;
}

$sql = "SELECT title, director, actor, poster, description, rating, genre, release_date, country, imdbVotes FROM movies WHERE title = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $movieTitle);
$stmt->execute();
$result = $stmt->get_result();
$movie = $result->fetch_assoc();

if (!$movie) {
    echo "Movie not found.";
    exit;
}

$sqlAccumulatedRating = "SELECT SUM(user_rating) AS accumulated_rating FROM seenepoll WHERE movieID = ?";
$stmtAccumulatedRating = $conn->prepare($sqlAccumulatedRating);
$stmtAccumulatedRating->bind_param("i", $movie['movieID']);
$stmtAccumulatedRating->execute();
$resultAccumulatedRating = $stmtAccumulatedRating->get_result();
$accumulatedRating = $resultAccumulatedRating->fetch_assoc()['accumulated_rating'];

$sqlReview = "SELECT user_review FROM seenepoll WHERE movieID = ?";
$stmtReview = $conn->prepare($sqlReview);
$stmtReview->bind_param("i", $movie['movieID']);
$stmtReview->execute();
$resultReview = $stmtReview->get_result();
$reviews = $resultReview->fetch_all(MYSQLI_ASSOC);

$sqlComment = "SELECT comment, comment_date FROM comments WHERE movieID = ?";
$stmtComment = $conn->prepare($sqlComment);
$stmtComment->bind_param("i", $movie['movieID']);
$stmtComment->execute();
$resultComment = $stmtComment->get_result();
$comments = $resultComment->fetch_all(MYSQLI_ASSOC);

$stmt->close();
$stmtAccumulatedRating->close();
$stmtReview->close();
$stmtComment->close();
$conn->close();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($movie['title']); ?> - Movie Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="movieOverview.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-4"><?php echo htmlspecialchars($movie['title']); ?></h1>
        <div class="row align-items-end">
            <div class="col-md-4">
                <img src="<?php echo htmlspecialchars($movie['poster']); ?>" class="img-fluid" alt="<?php echo htmlspecialchars($movie['title']); ?>">
            </div>
            <div class="col-md-4">
                <p><strong>Movie: </strong> <?php echo htmlspecialchars($movie['title']); ?></p>
                <p><strong>Director: </strong> <?php echo htmlspecialchars($movie['director']); ?></p>
                <p><strong>Lead Actor: </strong> <?php echo htmlspecialchars($movie['actor']); ?></p>
                <p><strong>Genre: </strong> <?php echo htmlspecialchars($movie['genre']); ?></p>
                <p><strong>Rating: </strong> <?php echo htmlspecialchars($movie['rating']); ?><sub>/10</sub></p>
                <p><strong>Year: </strong> <?php echo htmlspecialchars($movie['release_date']); ?></p>
                <p><strong>Country: </strong> <?php echo htmlspecialchars($movie['country']); ?></p>
                <p><strong>SeenePoll: </strong> <?php echo $accumulatedRating; ?></p>
                <p><strong>IMDB Votes: </strong> <?php echo number_format($movie['imdbVotes']); ?></p>
                <p><strong>Description: </strong> <?php echo htmlspecialchars($movie['description']); ?></p>
                <button class="btn btn-primary">Rate</button>
            </div>
        </div>
        <div class="row mt-4 user-feedback">
            <div class="col-md-12 feedback-column">
                <h2>User Reviews</h2>
                <?php foreach ($reviews as $review): ?>
                    <p><?php echo htmlspecialchars($review['user_review']); ?></p>
                <?php endforeach; ?>
            </div>
            <div class="col-md-12 feedback-column">
                <h2>Comments</h2>
                <?php foreach ($comments as $comment): ?>
                    <p><?php echo htmlspecialchars($comment['comment']); ?></p>
                <?php endforeach; ?>
            </div>
        </div>
        <a href="javascript:history.back()" class="btn btn-secondary mt-4">Back</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
