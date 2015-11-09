<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
    <li><a href="#">Home</a></li>
    <li><a href="#">Pages</a></li>
    <li><a href="#">Mailbox</a></li>
    <li class="active">Inbox</li>
</ul>
<!-- END BREADCRUMB -->

<!-- START CONTENT FRAME -->
<div class="content-frame">
    <!-- START CONTENT FRAME TOP -->
    <div class="content-frame-top">
        <div class="page-title">
            <h2><span class="fa fa-rocket"></span> Sent</h2>
        </div>

        <div class="pull-right">
            <button class="btn btn-default content-frame-left-toggle"><span class="fa fa-bars"></span></button>
        </div>
    </div>
    <!-- END CONTENT FRAME TOP -->

    <!-- START CONTENT FRAME LEFT -->
    <div class="content-frame-left">
        <div class="block">
            <a href="<?php echo base_url('message/compose'); ?>" class="btn btn-danger btn-block btn-lg"><span class="fa fa-edit"></span> COMPOSE</a>
        </div>
        <div class="block">
            <div class="list-group border-bottom">
                <a href="<?php echo base_url('message'); ?>" class="list-group-item"><span class="fa fa-inbox"></span> Inbox <span class="badge badge-success"><?php echo $count_inbox; ?></span></a>
                <a href="<?php echo base_url('message/sent'); ?>" class="list-group-item"><span class="fa fa-rocket"></span> Sent</a>
                <a href="<?php echo base_url('message/deleted'); ?>#" class="list-group-item"><span class="fa fa-trash-o"></span> Deleted</a>
            </div>
        </div>
    </div>
    <!-- END CONTENT FRAME LEFT -->

    <!-- START CONTENT FRAME BODY -->
    <div class="content-frame-body">

        <div class="panel panel-default">
            <div class="panel-body mail">
                <?php foreach($messages as $row): ?>
                <div class="mail-item <?php echo !$row->is_readed ? 'mail-unread' : ''; ?> mail-info">
                    <div class="mail-user"><?php echo $row->to_name; ?></div>
                    <a href="<?php echo base_url('message/detail/' . $row->id); ?>" class="mail-text"><?php echo !empty($row->subject) ? $row->subject : '[no subject]'; ?></a>
                    <div class="mail-date"><?php echo tanggal_format_indonesia($row->created_date, TRUE); ?></div>
                </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <!-- END CONTENT FRAME BODY -->
