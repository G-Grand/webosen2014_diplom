    <form action="/user/find" method="POST" id="finduser" name="finduser">
        <div class="row">
            <div class="col-sm-4 col-sm-offset-4">
                <div class="input-group">
                    <input type="email" class="form-control" name="email" placeholder="Search for...">
                     <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">Go!</button>
                     </span>
                </div><!-- /input-group -->
            </div>
        </div>
    </form>

    <?php if(is_array($params)): ?>
        <ul>
            <li>Email: <?=$params["email"]; ?></li>
            <li>Имя: <?=$params["username"]; ?></li>
            <li>День рождения: <?=$params["birthday"]; ?></li>
        </ul>
    <?php endif; ?>