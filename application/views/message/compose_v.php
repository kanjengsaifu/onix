<!-- START BREADCRUMB -->
<ul class="breadcrumb push-down-0">
    <li><a href="#">Home</a></li>
    <li><a href="<?php echo base_url('message'); ?>">Message</a></li>
    <li class="active">Compose</li>
</ul>
<!-- END BREADCRUMB -->

<!-- START CONTENT FRAME -->
<div class="content-frame">
    <!-- START CONTENT FRAME TOP -->
    <div class="content-frame-top">
        <div class="page-title">
            <h2><span class="fa fa-pencil"></span> Compose</h2>
        </div>
    </div>
    <!-- END CONTENT FRAME TOP -->

    <form action="<?php echo base_url('message/send'); ?>" method="post" enctype="multipart/form-data">
        <!-- START CONTENT FRAME LEFT -->
        <div class="content-frame-left">
            <div class="block">
                <table class="table datatable_withfilter">
                    <thead>
                    <tr>
                        <th>
                            Kepada:<br>
                            <?php echo form_error('to', '<small class="text-danger">', '</small>'); ?>
                        </th>
                        <td>
                            <label class="check">
                                <input type="checkbox" name="checkall" class="mail-to-checkall" autocomplete="off" value="1" <?php echo set_checkbox('checkall', 1); ?>/>
                            </label>
                        </td>
                    </tr>
                    </thead>
                    <tbody class="mail-to">
                    <?php foreach($petugas as $row): ?>
                        <tr class="mail-to-item">
                            <td><?php echo $row->nama; ?></td>
                            <td>
                                <input type="checkbox" name="to[]" value="<?php echo $row->id_petugas; ?>" autocomplete="off" class="mail-to-checkbox" <?php echo set_checkbox('to', $row->id_petugas); ?>>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- END CONTENT FRAME LEFT -->

        <!-- START CONTENT FRAME BODY -->
        <div class="content-frame-body">
            <div class="block">
                <div class="form-horizontal">
                    <div class="form-group">
                        <div class="col-md-12">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Subject:</label>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="subject" value="<?php echo set_value('subject'); ?>"/>
                            <?php echo form_error('subject', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label">Attachments:</label>
                        <div class="col-md-10">
                            <input type="file" class="file" name="userfile" data-filename-placement="inside"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <textarea class="summernote_lite" name="message">
                                <?php echo set_value('message'); ?>
                            </textarea>
                            <?php echo form_error('message', '<small class="text-danger">', '</small>'); ?>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12">
                            <div class="pull-right">
                                <button class="btn btn-danger"><span class="fa fa-envelope"></span> Send Message</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CONTENT FRAME BODY -->
    </form>
</div>
<!-- END CONTENT FRAME -->

<div class="content-frame-top">
    <div class="page-title">
        <h2></h2>
    </div>
</div>