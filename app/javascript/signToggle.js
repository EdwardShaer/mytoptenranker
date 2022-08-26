signButton = document.getElementById('sign_in_out')
//need csrf token for xhr header, or ActionController will reject the http request
csrfTokenNode = document.head.querySelector('meta[name="csrf-token"]');
csrfToken = csrfTokenNode.content;

signButton.addEventListener('click', (e) => {
    e.preventDefault();
    if (signButton.value === 'Sign out') {
        const xhr = new XMLHttpRequest();
        xhr.open('DELETE', '/session');
        xhr.onload = function () {
            alert('Successfully signed out');
        }
        xhr.setRequestHeader("X-CSRF-Token", csrfToken);
        xhr.send();
        signButton.value = 'Sign in';
    }

    else {
        window.location.replace('/session/new')
    }
});






 
