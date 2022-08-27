function deleteRanking(){
    let details = document.querySelector('#data-details');
    let rankingID = details.getAttribute('data-ranking-id');
    let userID = details.getAttribute('data-user-id');
    let rankerID = details.getAttribute('data-ranker-id');
    if (userID !== rankerID){
        alert('You cannot delete another user\'s ranking!');
        return;
    }
    let csrfTokenNode = document.head.querySelector('meta[name="csrf-token"]');
    let csrfToken = csrfTokenNode.content;
    const xhr = new XMLHttpRequest();
    xhr.open('DELETE', `/rankings/${rankingID}`);
    xhr.onload = function () {
        alert('Ranking Successfully Deleted');
    };
    xhr.setRequestHeader("X-CSRF-Token", csrfToken);
    xhr.send();
    window.location.replace(`/users/${userID}`);
}