<?php
 $message = ErMessenger::getInstance();
 ?>
<p class="bg-success"><?php echo (empty($message->getSucceedMessage())) ? $message->getSucceedMessage() : ''; ?></p>
<h1>Hello,
<?php if (ERSession::getFromSession('user')){
    echo ERSession::getFromSession('user');
    echo ERSession::getFromSession('username');
}
?> !!
</h1>