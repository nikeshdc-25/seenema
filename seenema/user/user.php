<?php
session_start();

if (!isset($_SESSION['userID'], $_SESSION['userName'], $_SESSION['userPassword'])) {
    header("Location: ../src/logout.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../seenema_img/seenemaLogo.png">
    <title>Seenema</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="../src/index.css">
    <link rel="stylesheet" href="user.css">
</head>
<body>
    <div class="container-fluid">
        <header class="d-flex align-items-center justify-content-left logo-container">
            <img src="../seenema_img/seenema_logo1.png" alt="Seenema Logo" class="me-2">
            <a class="seenemaTxt">SEENEMA</a> 
        </header>
        <nav class="button-container d-flex justify-content-center align-items-center flex-wrap">
            <button class="curved-button" title="Home"><i class="fas fa-home"></i></button>
            <button class="curved-button">Featured Movie</button>
            <button class="curved-button">Trending</button>
            <button class="curved-button">All Movies</button>
             <button class="curved-button filter-toggle" type="button">
                Filter
            </button>           
            <div class="search-container d-flex align-items-center">
                <input type="text" class="form-control me-2" placeholder="Quick Search..." aria-label="Search">
                <button class="search-button curved-button" title="Search"><i class="fas fa-search"></i></button>
            </div>
            <div class="user-container d-flex align-items-center">
                <button class="user-logo" type="button" id="userButton" aria-expanded="false">
                    <i class="fas fa-user-circle" style="font-size: 35px;"></i>
                </button>
                <div id="userMenu" class="user-menu" style="display: none;">
                    <p id="userMessage"></p>
                    <button id="logoutButton" class="logout-button" title="Logout">
                        <i class="fas fa-sign-out">Logout</i>
                    </button>
                </div>
            </div>
        </nav>
                <!--Filter Toggle-->
        <div class="filter-bar">
            <nav class="d-flex align-items-center justify-content-center flex-wrap">
                <div class="form-group">
                    <label for="year" class="sr-only">Year</label>
                    <select class="form-control" id="year">
                        <option value="">Year</option>
                        <option value="2024">2024</option>
                        <option value="2023">2023</option>
                        <option value="2022">2022</option>
                        <option value="2021">2021</option>
                        <option value="2020">2020</option>
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="rating" class="sr-only">Rating</label>
                    <input type="text" class="form-control" id="rating" placeholder="Rating" step="0.1" min="0" max="10">
                </div>
                <div class="form-group">
                    <label for="country" class="sr-only">Country</label>
                    <select class="form-control" id="country">
                        <option value="">Country</option>
                        <option value="USA">United States</option>
                        <option value="India">India</option>
                        <option value="Nepal">Nepal</option>
                        <option value="China">China</option>
                        <option value="UK">United Kingdom</option>
                        <option value="France">France</option>
                        <option value="Japan">Japan</option>
                        <option value="Germany">Germany</option>
                        <option value="South Korea">South Korea</option>
                        <option value="Italy">Italy</option>
                        <option value="Canada">Canada</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="genre" class="sr-only">Genre</label>
                    <select class="form-control" id="genre">
                        <option value="">Genre</option>
                        <option value="action">Action</option>
                        <option value="adventure">Adventure</option>
                        <option value="comedy">Comedy</option>
                        <option value="history">History</option>
                        <option value="animation">Animation</option>
                        <option value="crime">Crime</option>
                        <option value="family">Family</option>
                        <option value="drama">Drama</option>
                        <option value="fantasy">Fantasy</option>
                        <option value="horror">Horror</option>
                        <option value="mystery">Mystery</option>
                        <option value="romance">Romance</option>
                        <option value="sci-fi">Sci-Fi</option>
                        <option value="thriller">Thriller</option>
                        <option value="war">War</option>
                        <option value="western">Western</option>
                    </select>
                </div>
                <button class="search-filter" title="Search" type="submit"><i class="fas fa-search"></i></button>
            </nav>
        </div>
            
        <main class="col-lg-10 col-md-9 col-sm-8 col-12">
            <div class="movie-container d-flex justify-content-center flex-wrap" id="movie-cards">
            </div>
            <section id="movie-cards" class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
            </section>
        </main>
    </div>
    <script>
       document.addEventListener('DOMContentLoaded', function() {
            const movieContainer = document.querySelector('.movie-container');
            
            fetch('../movies/fetch_movies.php')
                .then(response => response.json())
                .then(data => {
                    data.forEach(movie => {
                        const movieCard = document.createElement('div');
                        movieCard.classList.add('movie-card');

                        const img = document.createElement('img');
                        img.src = movie.poster;
                        img.alt = movie.title;
                        movieCard.appendChild(img);

                        const overlay = document.createElement('div');
                        overlay.classList.add('movie-overlay');

                        const movieRating = document.createElement('div');
                        movie.imdbVotes = parseInt(movie.imdbVotes);
                        movieRating.classList.add('movie-rating');
                        movieRating.textContent = `Rating: ${movie.rating}/10❤️:${movie.imdbVotes.toLocaleString()}`;
                        overlay.appendChild(movieRating);

                        movieCard.appendChild(overlay);

                        const title = document.createElement('p');
                        title.classList.add('movie-title');
                        title.textContent = movie.title;
                        movieCard.appendChild(title);

                        movieCard.addEventListener('click', function() {
                            window.location.href = `../movies/movieOverview.php?title=${encodeURIComponent(movie.title)}`;
                        });

                        movieContainer.appendChild(movieCard);
                    });
                })
                .catch(error => console.error('Error fetching movies:', error));
        });
    </script>
    <script src="../src/index.js"></script>
    <script src="user.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
