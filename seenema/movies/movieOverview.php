<?php
session_start();

$host = "localhost";
$username = "root";
$password = "";
$dbname = "seenema";

$conn = new mysqli($host, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function getMovieDetails($conn, $movieTitle) {
    $sql = "SELECT movieID, title, director, actor, poster, description, rating, genre, release_date, country, imdbVotes FROM movies WHERE title = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $movieTitle);
    $stmt->execute();
    $result = $stmt->get_result();
    $movie = $result->fetch_assoc();
    $stmt->close();
    return $movie;
}

$movieTitle = isset($_GET['title']) ? $_GET['title'] : '';

if (empty($movieTitle)) {
    die("Movie title is missing.");
}

$movie = getMovieDetails($conn, $movieTitle);

if (!$movie) {
    die("Movie not found.");
}

$sqlAccumulatedRating = "SELECT SUM(user_rating) AS accumulated_rating, COUNT(*) AS total_votes FROM seenepoll WHERE movieID = ?";
$stmtAccumulatedRating = $conn->prepare($sqlAccumulatedRating);
$stmtAccumulatedRating->bind_param("i", $movie['movieID']);
$stmtAccumulatedRating->execute();
$resultAccumulatedRating = $stmtAccumulatedRating->get_result();
$ratingData = $resultAccumulatedRating->fetch_assoc();
$accumulatedRating = $ratingData['accumulated_rating'];
$totalVotes = $ratingData['total_votes'];
$averageRating = $totalVotes > 0 ? $accumulatedRating / $totalVotes : 0;

$sqlReviews = "SELECT sp.user_review, sp.review_title, ud.userName, sp.userID, sp.user_rating 
               FROM seenepoll sp
               INNER JOIN userdata ud ON sp.userID = ud.userID 
               WHERE sp.movieID = ?";
$stmtReviews = $conn->prepare($sqlReviews);
$stmtReviews->bind_param("i", $movie['movieID']);
$stmtReviews->execute();
$resultReviews = $stmtReviews->get_result();
$reviews = $resultReviews->fetch_all(MYSQLI_ASSOC);

$loggedInUserID = isset($_SESSION['userID']) ? $_SESSION['userID'] : null;
$userReviewed = false;

foreach ($reviews as $review) {
    if ($review['userID'] == $loggedInUserID) {
        $userReviewed = true;
    }
}

$sqlComments = "SELECT c.commentID, c.comment, c.comment_date, c.userID, u.userName 
                FROM comments c
                INNER JOIN userdata u ON c.userID = u.userID
                WHERE c.movieID = ?";
$stmtComments = $conn->prepare($sqlComments);
$stmtComments->bind_param("i", $movie['movieID']);
$stmtComments->execute();
$resultComments = $stmtComments->get_result();
$comments = $resultComments->fetch_all(MYSQLI_ASSOC);

$stmtAccumulatedRating->close();
$stmtReviews->close();
$stmtComments->close();
$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../seenema_img/seenemaLogo.png">
    <title><?php echo htmlspecialchars($movie['title']); ?> - Movie Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="movieOverview.css">
    <style>

    #rating-container, #comment-container {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #111;
    padding: 20px;
    border-radius: 10px;
    z-index: 1;
    color: #fff;
    text-align: center;
    width: 80%;
    max-width: 600px;
    align-items: center;
    justify-content: center;
    overflow: visible;
    padding-top: 60px;
    box-sizing: border-box;
    margin-top: -50px;
}
.review-container{
    margin-bottom: 10px;
    background-color: rgb(39, 39, 39);  
    transition: transform 0.3s, box-shadow 0.3s;
    color: #fff;
}
.comment-container{
margin-bottom: 10px;
border: none;
color: #fff;
background-color: rgb(39, 39, 39);
}
.commentsPreview {
    background-color: rgb(32, 32, 32);
    padding: 10px;
    margin-bottom: 10px;
    border-left: 3px solid #8b18b9;
}

.commentsPreview:hover {
    transform: translateY(-4px);
}

.close-button {
    background-color: red;
    border-radius: 5px;
    color: #fff;
    position: absolute;
    top: 10px;
    right: 10px;
    cursor: pointer;
}

.close-button:hover {
    color: #f1c40f;
}

.stars {
    display: flex;
    justify-content: center;
    font-size: 1.5rem;
    position: absolute;
    top: -20px;
    left: 50%;
    transform: translateX(-50%);
}

.stars input[type="radio"] {
    display: none;
}

.stars label {
    font-size: 2rem;
    color: #666;
    cursor: pointer;
    margin: 0 5px;
    transition: color 0.3s;
}

.stars input[type="radio"]:checked ~ label {
    color: #0ff113;
}

.stars label:hover,
.stars label:hover ~ label,
.stars input[type="radio"]:checked ~ label ~ label {
    color: #ffbb00;
}

#review_title, #userReview {
    width: 80%;
    margin: 10px auto;
    display: block;
    background-color: rgb(39, 39, 39);
    color: #fff;
}

#review_title {
    height: 2rem;
}

#userReview {
    height: 4rem;
}

#userComment {
    width: 100%;
    display: block;
    background-color: rgb(39, 39, 39);
    color: #a9a9a9;
    height: 3rem;
    margin-bottom: 10px;
    overflow-y: auto;
    scrollbar-width: none;
    -ms-overflow-style: none;
    border: 1px solid rgb(101, 101, 101);
}

#userComment::-webkit-scrollbar {
    display: none; 
}
    </style>
</head>
<body>
<div class="container">
    <div class="middle">
        <h1 class="mt-4"><?php echo htmlspecialchars($movie['title']); ?></h1>
        <div class="row align-items-end">
            <div class="col-md-4">
                <img src="<?php echo htmlspecialchars($movie['poster']); ?>" class="img-fluid" alt="<?php echo htmlspecialchars($movie['title']); ?>">
            </div>
            <div class="col-md-4">
                <p><strong>Movie:</strong> <b><?php echo htmlspecialchars($movie['title']); ?></b></p>
                <p><strong>Director:</strong> <?php echo htmlspecialchars($movie['director']); ?></p>
                <p><strong>Lead Actor:</strong> <?php echo htmlspecialchars($movie['actor']); ?></p>
                <p><strong>Genre:</strong> <?php echo htmlspecialchars($movie['genre']); ?></p>
                <p><strong>IMDb Rating:</strong> <?php echo htmlspecialchars($movie['rating']); ?>/10</p>
                <p><strong>Release-Date:</strong> <?php echo htmlspecialchars($movie['release_date']); ?></p>
                <p><strong>Country:</strong> <?php echo htmlspecialchars($movie['country']); ?></p>
                <p><strong>SeenePoll:</strong> <?php echo number_format($averageRating, 1); ?>/10</p>
                <p><strong>IMDb Votes:</strong> <?php echo number_format($movie['imdbVotes']); ?></p>
                <p><strong>Description:</strong> <?php echo htmlspecialchars($movie['description']); ?></p>
                <?php if (!$userReviewed): ?>
                    <button class="btn btn-success" onclick="openRatePopup()">Rate</button>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div id="rating-container">
        <button class="close-button" onclick="closeRatingPopup()"><i class="fas fa-times"></i></button>
        <div class="stars">
            <?php for ($i = 1; $i <= 10; $i++): ?>
                <input type="radio" name="rating" id="star<?php echo $i; ?>" value="<?php echo $i; ?>" onclick="setRating(<?php echo $i; ?>)">
                <label class="star fas fa-star" for="star<?php echo $i; ?>"></label>
            <?php endfor; ?>
        </div>
        <textarea id="review_title" name="review_title" placeholder="Highlight for your review..." style="display: none;" required></textarea>
        <textarea id="userReview" name="user_review" placeholder="Write your review here..." style="display: none;"></textarea>
        <button type="button" class="btn btn-success mt-3" onclick="submitRating()">Submit</button>
    </div>
    <div class="row mt-4 user-feedback">
        <div class="col-md-12 feedback-column">
            <h2>❤️ User Reviews</h2>
            <?php foreach ($reviews as $review): ?>
                <div class="review-container">
                    <strong><x>Reviewed by: </x><?php echo htmlspecialchars($review['userName']) . '   ' .'   '. '❤️  ' . (int)$review['user_rating'] . '/10'; ?></strong>
                    <p style="font-weight:500; font-size:20px;"><?php echo htmlspecialchars($review['review_title']); ?></p>
                    <p style="border-bottom: 1px solid rgb(115, 115, 115); color: #c8c8c8;"><?php echo htmlspecialchars($review['user_review']); ?></p>
                </div>
            <?php endforeach; ?>
        </div>
        <div class="col-md-12 feedback-column">
            <h2>💭 Comments</h2>
            <div class="comment-container">
                <textarea id="userComment" name="user_comment" placeholder="Comment..." oninput="togglePostButton()"></textarea>
                <button class="btn btn-primary" id="postButton" onclick="submitComment()" style="display:none;">Post</button>
                <?php foreach ($comments as $comment): ?>
                    <div id="comment-<?php echo $comment['commentID']; ?>" class="commentsPreview">
                        <div class="comment-item">
                            <p style="font-size:18px; font-weight:600;">
                                <?php echo htmlspecialchars($comment['userName']); ?>: 
                                <em style="font-size:14px; font-weight:400;">(<?php echo htmlspecialchars($comment['comment_date']); ?>)</em>
                                <?php if ($loggedInUserID && $comment['userID'] == $loggedInUserID): ?>
                                    <button class="btn btn-danger btn-sm float-end" onclick="deleteComment(<?php echo $comment['commentID']; ?>)">
                                        <i class="fas fa-trash-alt"></i>
                                    </button>
                                <?php endif; ?>
                            </p>
                            <p><?php echo htmlspecialchars($comment['comment']); ?></p>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <a href="javascript:history.back()" class="btn btn-secondary mt-4">Back</a>
</div>
    <script>
    function openRatePopup() {
        <?php if (!isset($_SESSION['userID'])): ?>
            alert("Please log in to rate this movie.");
            location.reload();
            return;
        <?php endif; ?>

        document.getElementById('rating-container').style.display = 'block';
    }

    function closeRatingPopup() {
        document.getElementById('rating-container').style.display = 'none';
        location.reload();
    }

    function setRating(rating) {
        document.getElementById('userReview').style.display = 'block';
        document.getElementById('review_title').style.display = 'block';
    }
    //For rate submission
    function submitRating() {
        const movieID = <?php echo $movie['movieID']; ?>;
        const userID = <?php echo isset($_SESSION['userID']) ? $_SESSION['userID'] : 'null'; ?>;
        const rating = document.querySelector('input[name="rating"]:checked');
        const reviewTitle = document.getElementById('review_title').value;
        const review = document.getElementById('userReview').value;

        if (!rating) {
            alert("Please select a rating.");
            return;
        }

        if (userID == null) {
            alert("Please log in to rate this movie.");
            window.location.href = '../src/logout.php';
            return;
        }

        fetch('rate.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `movieID=${movieID}&userID=${userID}&rating=${rating.value}&review_title=${encodeURIComponent(reviewTitle)}&review=${encodeURIComponent(review)}`
        })
        .then(response => {
            if (response.ok) {
                alert("Rating submitted successfully!");
                document.getElementById('rating-container').style.display = 'none';
                location.reload();
            } else {
                return response.text().then(text => { throw new Error(text); });
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
    //For post button popup
    function togglePostButton() {
        const commentTextarea = document.getElementById('userComment');
        const postButton = document.getElementById('postButton');

        if (commentTextarea.value.trim() !== '') {
            postButton.style.display = 'block';
        } else {
            postButton.style.display = 'none';
        }
    }
    //For comments posting!
    function submitComment() {
        const movieID = <?php echo $movie['movieID']; ?>;
        const userID = <?php echo isset($_SESSION['userID']) ? $_SESSION['userID'] : 'null'; ?>;
        const comment = document.getElementById('userComment').value;

        if (!comment) {
            alert("Please write a comment.");
            return;
        }

        if (userID == null) {
            alert("Please log in to comment on this movie.");
            location.reload();
            return;
        }

        fetch('comment.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `movieID=${movieID}&userID=${userID}&comment=${encodeURIComponent(comment)}`
        })
        .then(response => {
            if (response.ok) {
                document.getElementById('userComment').value = '';
                togglePostButton();
                location.reload();
            } else {
                return response.text().then(text => { throw new Error(text); });
            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
    //For comments deletion!
    function deleteComment(commentID) {
    if (confirm("Are you sure you want to delete this comment?")) {
        fetch('delete_comment.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `commentID=${commentID}`
        })
        .then(response => {
            if (response.ok) {
                location.reload();
            } else {
                throw new Error('Failed to delete comment.');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Failed to delete comment. Please try again.');
        });
    }
}
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
