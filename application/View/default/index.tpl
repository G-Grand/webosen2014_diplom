<p class="bg-success"><?php echo ($this->_messages->getSucceedMessage()) ? $this->_messages->getSucceedMessage() : ''; ?></p>
<h1>Hello,
<?php if (ERSession::getFromSession('user')){
    echo ERSession::getFromSession('user');
    echo ERSession::getFromSession('username');
}
?> !!
</h1>