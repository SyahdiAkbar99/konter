<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test View</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>

<body>
    <pre>
    <!-- <div id="token" class="text-center"></div> -->
    </pre>
    <table class="table table-responsive">
        <thead>
            <tr>
                <th>No</th>
                <th>Dari</th>
                <th>Ke</th>
                <th>Isi</th>
            </tr>
        </thead>
        <tbody>
            <?php $i = 1; ?>
            <?php foreach ($notif as $nf) : ?>
                <tr>
                    <td><?= $i; ?></td>
                    <td><?= $nf['dari']; ?></td>
                    <td><?= $nf['ke']; ?>
                    <td><?= $nf['isi_pesan']; ?>
                </tr>
                <?php $i++; ?>
            <?php endforeach; ?>
        </tbody>
    </table>



    <script src="https://www.gstatic.com/firebasejs/8.4.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.4.0/firebase-messaging.js"></script>
    <!-- <script src="../assets/js/firebase-messaging-sw.js"></script> -->
    <script>
        var firebaseConfig = {
            apiKey: "AIzaSyBnknjPRRHDh1aYgFgHIWgZ84QOM9O-Xng",
            authDomain: "sendmessagenotif.firebaseapp.com",
            projectId: "sendmessagenotif",
            storageBucket: "sendmessagenotif.appspot.com",
            messagingSenderId: "175275880669",
            appId: "1:175275880669:web:666e6ba4333d5cfa5d2b34",
            measurementId: "G-YQCZFJC820"
        };
        firebase.initializeApp(firebaseConfig);
        const messaging = firebase.messaging();

        function IntitalizeFireBaseMessaging() {
            messaging
                .requestPermission()
                .then(function() {
                    console.log("Notification Permission");
                    return messaging.getToken();
                })
                .then(function(token) {
                    console.log("Token : " + token);
                    document.getElementById("token").innerHTML = token;
                })
                .catch(function(reason) {
                    console.log(reason);
                });
        }

        messaging.onMessage(function(payload) {
            console.log(payload);
            const notificationOption = {
                body: payload.notification.body,
                icon: payload.notification.icon
            };

            if (Notification.permission === "granted") {
                var notification = new Notification(payload.notification.title, notificationOption);

                notification.onclick = function(ev) {
                    ev.preventDefault();
                    window.open(payload.notification.click_action, '_blank');
                    notification.close();
                }
            }

        });
        messaging.onTokenRefresh(function() {
            messaging.getToken()
                .then(function(newtoken) {
                    console.log("New Token : " + newtoken);
                })
                .catch(function(reason) {
                    console.log(reason);
                })
        })
        IntitalizeFireBaseMessaging();
    </script>


    <!-- <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->

</body>

</html>