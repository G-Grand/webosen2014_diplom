<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>
        <?php if($this->headerTitle): ?>
            <?php echo $this->headerTitle; ?>
        <?php endif; ?>
    </title>

    <!-- Bootstrap -->
    <link rel="stylesheet" href="/application/data/CSS/jquery-ui.css">
    <link rel="stylesheet" href="/application/data/CSS/jquery-ui.theme.css">
    <link rel="stylesheet" type="text/css" href="/application/data/CSS/jquery.datetimepicker.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="/application/data/CSS/style.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/application/data/js/jquery.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="/application/data/js/jquery.datetimepicker.js"></script>
    <script src="/application/data/js/jquery-ui.js"></script>

</head>
<body>
<p class="bg-success"><?php echo $this->_messages->getSucceedMessage($this->getRefererUrl()); ?></p>
<p class="bg-info"><?php echo $this->_messages->getErrMessage($this->getRefererUrl()); ?></p>
<p class="bg-warning"><?php echo $this->_messages->getNotesMessage($this->getRefererUrl()); ?></p>