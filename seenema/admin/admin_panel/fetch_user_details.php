<?php
session_start();

if (!isset($_SESSION['admin_id'], $_SESSION['admin_username'])) {
    header("Location: ../../src/logout.php");
    exit;
}

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "seenema";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['userID'])) {
    $userID = $_GET['userID'];

    // Query to fetch user details and related reviews, ratings, and comments
    $userQuery = "
        SELECT u.username, u.email, u.favDish, p.user_rating, p.review_title, p.user_review, c.comment, m.title
        FROM userdata u
        LEFT JOIN seenepoll p ON u.userID = p.userID
        LEFT JOIN comments c ON u.userID = c.userID
        LEFT JOIN movies m ON p.movieID = m.movieID OR c.movieID = m.movieID
        WHERE u.userID = $userID
    ";

    $result = $conn->query($userQuery);

    if ($result->num_rows > 0) {
        $userData = $result->fetch_assoc();
        $username = htmlspecialchars($userData['username']);
        $email = htmlspecialchars($userData['email']);
        $favDish = htmlspecialchars($userData['favDish']);

        // Display user details
        echo "
            <h5>Username: $username</h5>
            <p>Email: $email</p>
            <p>Favorite Dish: $favDish</p>
        ";

        // Display reviews, ratings, and comments if available
        echo "<h6>Reviews, Ratings, and Comments</h6>";
        echo "<div>";
        $commentsByMovie = [];
        do {
            $title = htmlspecialchars($userData['title']);
            if (!isset($commentsByMovie[$title])) {
                $commentsByMovie[$title] = [
                    'rating' => null,
                    'review_title' => null,
                    'review' => null,
                    'comments' => []
                ];
            }
            if ($userData['user_rating'] !== null) {
                $commentsByMovie[$title]['rating'] = $userData['user_rating'];
                $commentsByMovie[$title]['review_title'] = $userData['review_title'];
                $commentsByMovie[$title]['review'] = $userData['user_review'];
            }
            if ($userData['comment'] !== null) {
                $commentsByMovie[$title]['comments'][] = $userData['comment'];
            }
        } while ($userData = $result->fetch_assoc());

        foreach ($commentsByMovie as $title => $details) {
            echo "<p><strong>Movie:</strong> $title</p>";
            if ($details['rating'] !== null) {
                echo "<p><strong>Rating:</strong> {$details['rating']}</p>";
                echo "<p><strong>Review Title:</strong> {$details['review_title']}</p>";
                echo "<p><strong>Review:</strong> {$details['review']}</p>";
            }
            if (!empty($details['comments'])) {
                echo "<p><strong>Comments:</strong></p><ul>";
                foreach ($details['comments'] as $comment) {
                    echo "<li>$comment</li>";
                }
                echo "</ul>";
            }
        }
        echo "</div>";
    } else {
        echo "User not found.";
    }
} else {
    echo "User ID not provided.";
}

$conn->close();
?>
