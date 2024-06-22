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

$sql = "SELECT movieID, title, description, poster FROM movies";
$result = $conn->query($sql);

$movies = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $movies[] = $row;
    }
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Seenema</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #939ab7;
        }
        .container {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            min-height: 100vh;
            background-color: #111c46;
            padding: 20px;
        }
        .admin-panel {
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-wrap: wrap; /* Ensures items wrap to new lines on smaller screens */
            width: 100%;
            max-width: 1000px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background-image: linear-gradient(to top, rgb(0, 0, 0),  #2377ec);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .admin-panel h2 {
            font-size: 25px;
            font-weight: bold;
            color: #fff;
            margin-bottom: 10px;
        }
        .text-center {
            text-align: center;
            color: red;
            font-weight: bolder;
            font-family: monospace;
        }
        .btn {
            padding: 10px 20px;
            margin: 10px;
            border-radius: 5px;
            font-size: 18px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            white-space: nowrap; /* Ensures button text doesn't wrap */
        }
        .btn:hover {
            background-color: #333;
            color: #fff;
        }
        .movie-card {
            border: 1px solid #ccc;
            border-radius: 8px;
            margin: 10px;
            padding: 15px;
            background-color: #f9f9f9;
            max-width: 300px;
            text-align: center;
        }
        .movie-card img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .movie-card h5 {
            margin: 0 0 10px;
            font-size: 20px;
            font-weight: bold;
        }
        .movie-card p {
            margin: 0;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="text-center">
            <?php echo "Welcome, " . htmlspecialchars($_SESSION['admin_username']); ?>
        </div>
        <div class="admin-panel">
            <h2 class="text-center">Admin Panel</h2>
            <div class="d-flex justify-content-center flex-wrap"> <!-- Flex container for buttons -->
                <a href="../../src/logout.php" id="homeBtn" class="btn btn-danger">Home</a>
                <a href="update.php" id="updateMoviesBtn" class="btn btn-success">Update Movies</a>
                <a href="upload.php" id="uploadMoviesBtn" class="btn btn-info">Add Movie</a>
                <a href="addedAdmin.php" id="addAdminBtn" class="btn btn-primary">Add Admin</a>
            </div>
        </div>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 justify-content-center">
            <?php foreach ($movies as $movie): ?>
                <div class="col">
                    <div class="movie-card">
                        <img src="<?php echo htmlspecialchars($movie['poster']); ?>" alt="<?php echo htmlspecialchars($movie['title']); ?>">
                        <h5><?php echo htmlspecialchars($movie['title']); ?></h5>
                        <p>ID: <?php echo htmlspecialchars($movie['movieID']); ?></p>
                        <button class="btn btn-danger delete-btn" data-movie-id="<?php echo $movie['movieID']; ?>">Delete</button>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const deleteButtons = document.querySelectorAll('.delete-btn');
            
            deleteButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const movieId = this.getAttribute('data-movie-id');

                    if (confirm('Are you sure you want to delete this movie?')) {
                        fetch('delete_movie.php', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/x-www-form-urlencoded',
                            },
                            body: 'movie_id=' + encodeURIComponent(movieId)
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.status === 'success') {
                                alert('Movie deleted successfully');
                                location.reload();
                            } else {
                                alert('Error: ' + data.message);
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('An error occurred while deleting the movie');
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>
