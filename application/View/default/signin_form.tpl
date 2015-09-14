<form class="form-horizontal" action="<?php echo ($this->login_flag) ? "/user/authorise" : "/user/register"; ?>" method="post">
    <div class="form-group">
        <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
        <div class="col-sm-10">
            <input type="email" class="form-control" name="email" id="inputEmail3" placeholder="Email">
        </div>
    </div>
    <div class="form-group">
        <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" name="userpassword" id="inputPassword3" placeholder="Password">
        </div>
    </div>
    <?php if(!$this->login_flag): ?>
        <div class="form-group">
            <label for="inputPassword4" class="col-sm-2 control-label">Confirm password</label>
            <div class="col-sm-10">
                <input type="password" class="form-control" name="userpassconf" id="inputPassword4" placeholder="Confirm password">
            </div>
        </div>
    <?php endif; ?>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Remember me
                </label>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default"><?php echo ($this->login_flag) ? "Log in" : "Sign in"; ?></button>
        </div>
    </div>
</form>