<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('message'); ?>">Message</a></li>
    <li class="active">Detail</li>
</ul>
<!-- END BREADCRUMB -->

<!-- START CONTENT FRAME -->
<div class="content-frame">
    <!-- START CONTENT FRAME TOP -->
    <div class="content-frame-top">
        <div class="page-title">
            <h2><span class="fa fa-file-text"></span> Message</h2>
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
                <a href="<?php echo base_url('message/deleted'); ?>" class="list-group-item"><span class="fa fa-trash-o"></span> Deleted</a>
            </div>
        </div>
    </div>
    <!-- END CONTENT FRAME LEFT -->


    <!-- START CONTENT FRAME BODY -->
    <div class="content-frame-body">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="pull-left">
                    <h3 class="panel-title">From: <?php echo $message->from_name; ?></h3><br>
                    <h3 class="panel-title">To: <?php echo $message->to_name; ?></h3>
                </div>
                <div class="pull-right">
                    <form action="<?php echo base_url('message/trash'); ?>" method="post">
                        <input type="hidden" name="id" value="<?php echo $message->id; ?>">
                        <button class="btn btn-default" id="btn-delete-message"><span class="fa fa-trash-o"></span></button>
                    </form>
                </div>
            </div>
            <form action="<?php echo base_url('message/send'); ?>" method="post">
                <div class="panel-body">
                    <?php if(!empty($message->reply_to)): ?>
                        <div class="well-lg">
                            <h3>Reply to:</h3>
                            <?php echo $message->reply_to->message; ?>
                        </div>
                    <?php endif; ?>

                    <h3><?php echo $message->subject; ?> <small class="pull-right text-muted"><span class="fa fa-clock-o"></span> <?php echo tanggal_format_indonesia($message->created_date, TRUE); ?></small></h3>
                    <p>
                        <?php echo $message->message; ?>
                    </p>

                    <div class="form-group push-up-20">
                        <label>Quick Reply</label>
                        <textarea class="form-control summernote_lite" name="message" rows="3"></textarea>
                    </div>
                </div>
                <div class="panel-body panel-body-table">
                    <h6>Attachments</h6>
                    <table class="table">
                        <?php
                        if(!empty($message->attachment) OR $message->attachment):
                            $attachment = json_decode($message->attachment);
                            ?>
                            <tr>
                                <td>
                                    <a href="<?php echo $attachment->full_path; ?>"><i class="fa fa-file"></i> <?php echo $attachment->file_name; ?></a>
                                </td>
                            </tr>
                        <?php else: ?>
                            <tr>
                                <td>Tidak Ada</td>
                            </tr>
                        <?php endif; ?>
                    </table>
                </div>
                <div class="panel-footer">
                    <input type="hidden" name="subject" value="re: <?php echo $message->subject; ?>">
                    <input type="hidden" name="to[]" value="<?php echo $message->message_to; ?>">
                    <input type="hidden" name="reply_to" value="<?php echo $message->id; ?>">
                    <button class="btn btn-success pull-right"><span class="fa fa-mail-reply"></span> Post Reply</button>
                </div>
            </form>
        </div>
    </div>
    <!-- END CONTENT FRAME BODY -->

</div>
<!-- END CONTENT FRAME -->