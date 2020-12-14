

window.fbAsyncInit = function () {
    FB.init({
        appId: '225253855663519',
        cookie: true,
        xfbml: true,
        version: 'v9.0'
    });

    FB.AppEvents.logPageView();

    FB.getLoginStatus(function (response) {
    });

};
function LoginFaceBook() {
    FB.getLoginStatus(function (response) {
        var scopeGetAPIFacebook = angular.element(document.getElementById('logdiv')).scope();
        FB.api('/me', function (response) {
            FB.api('/me', 'GET', { fields: 'id, name, email, link, gender, picture' }, function (response) {
                scopeGetAPIFacebook.LoginFaceBook(response);
            })
        })
        
    });
}
(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) { return; }
    js = d.createElement(s); js.id = id;
    js.src = "https://connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

function LogOutFaceBook() {
    FB.logout();
    FB.getLoginStatus(function (response) {
    });
    window.location.reload();
}

