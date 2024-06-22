document.addEventListener('DOMContentLoaded', function() {
    const loginModal = document.getElementById('loginModal');
    const registerModal = document.getElementById('registerModal');
    const forgetModal = document.getElementById('forgetModal');
    const loginButton = document.querySelector('.signup-button');
    const closeButtons = document.querySelectorAll('.close-btn');
    const backButton = document.querySelector('.back-btn');
    const registerLink = document.getElementById('registerLink');
    const loginLink = document.getElementById('loginLink');
    const forgetLinks = document.querySelectorAll('.forget');
    const filterToggle = document.querySelector('.filter-toggle');
    const filterBar = document.querySelector('.filter-bar');


    filterBar.style.display = 'none';
    filterToggle.addEventListener('click', () => {
        if (filterBar.style.display === 'none') {
            filterBar.style.display = 'block';
        } else {
            filterBar.style.display = 'none';
        }
    });
    
    if (loginButton) {
        loginButton.addEventListener('click', function() {
            loginModal.style.display = 'flex';  // Show login modal
        });
    }
        closeButtons.forEach(btn => {
            btn.addEventListener('click', function() {
                loginModal.style.display = 'none';
                registerModal.style.display = 'none';
                forgetModal.style.display = 'none';
            });
        });
    
    if (backButton){
        backButton.addEventListener('click', function() {
            forgetModal.style.display = 'none';
            loginModal.style.display = 'flex';  // Show login modal
        });
    }
    

    window.addEventListener('click', function(event) {
        if (event.target === loginModal) {
            loginModal.style.display = 'none';
        }
        if (event.target === registerModal) {
            registerModal.style.display = 'none';
        }
        if (event.target === forgetModal) {
            forgetModal.style.display = 'none';
        }
    });

    if(registerLink){
        registerLink.addEventListener('click', function(event) {
            event.preventDefault();
            registerModal.style.display = 'flex';
            loginModal.style.display = 'none';
        });
    }
    
if(loginLink){
    loginLink.addEventListener('click', function(event) {
        event.preventDefault();
        registerModal.style.display = 'none';
        loginModal.style.display = 'flex';  // Show login modal
    });
}
    if(forgetLinks){
        forgetLinks.forEach(link => {
            link.addEventListener('click', function(event) {
                event.preventDefault();
                loginModal.style.display = 'none';
                forgetModal.style.display = 'flex';  // Show forget modal
            });
        });
    }
    

    document.getElementById('loginForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(this);
    
        fetch('login.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                alert("Login Successfully!");
                localStorage.setItem('username', data.username);
                window.location.href = '../user/user.php';
            } else {
                alert(data.message);
            }
        })
        .catch(error => console.error('Error:', error));
    });
    

    document.getElementById('registerForm').addEventListener('submit', function(event) {
        event.preventDefault();
        
        const formData = new FormData(this);
    
        fetch('register.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                loginModal.style.display = 'flex';
                forgetModal.style.display = 'none';
                registerModal.style.display = 'none';
                alert("Registered Successfully! You can now login")
            } else {
                alert(data.message);
            }
        })
        .catch(error => console.error('Error:', error));
    });
    
    document.getElementById('forgetForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const formData = new FormData(this);
    
        fetch('forget.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.status === 'success') {
                loginModal.style.display = 'flex';
                forgetModal.style.display = 'none';
                alert("Password reset successfully! You can now login.");
            } else {
                alert(data.message);
            }
        })
        .catch(error => console.error('Error:', error));
    });
    
});