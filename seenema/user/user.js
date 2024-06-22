document.addEventListener('DOMContentLoaded', function() {
    const userButton = document.getElementById('userButton');
    const userMenu = document.getElementById('userMenu');
    const userMessage = document.getElementById('userMessage');
    const logoutButton = document.getElementById('logoutButton');

    const username = localStorage.getItem('username');

    if (userButton) {
        userButton.addEventListener('click', function() {
            userMessage.textContent = `Hi, ${username}!`;
            userMenu.style.display = userMenu.style.display === 'none' ? 'block' : 'none';
        });
    }

    if (logoutButton) {
        logoutButton.addEventListener('click', function() {
            localStorage.removeItem('username');
            window.location.href = '../src/logout.php';
        });
    }

    document.addEventListener('click', function(event) {
        if (!userMenu.contains(event.target) && !userButton.contains(event.target)) {
            userMenu.style.display = 'none';
        }
    });
});