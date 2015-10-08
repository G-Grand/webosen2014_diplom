<h1>Hello,
<?php if (ERSession::getFromSession('user')){
    echo ERSession::getFromSession('user');
    echo ERSession::getFromSession('username');
}
?> !!
</h1>
