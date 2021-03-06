<?php defined('BASEPATH') or exit('No direct script access allowed');
include(ADMIN_INCLUDE_PATH . '/header.php');
include(ADMIN_INCLUDE_PATH . '/sidebar.php');
?>
<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <h1><?= $this->lang->line('categories') ?></h1>
                        </div>
                    </div>
                </div><!-- /# column -->
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="<?= DASHBOARD_PATH ?>"><?= $this->lang->line('dashboard') ?></a></li>
                                <li><a href="<?= CATEGORY_PATH ?>"><?= $this->lang->line('category_list') ?></a></li>
                                <li><a class="active" href="javascript:void(0)"><?= $this->lang->line('add_category') ?></a></li>


                            </ol>
                        </div>
                    </div>
                </div><!-- /# column -->
            </div><!-- /# row -->

            <div class="main-content">
                <?php if (isset($success_message) && $success_message != '') {  ?>

                    <div class="alert alert-info alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong><?= $this->lang->line('success') ?>!</strong> <?php echo isset($success_message) ? $success_message : $this->session->flashdata('invalid'); ?>
                    </div>

                <?php  } ?>

                <?php if (isset($error_message) && $error_message != '') {  ?>

                    <div class="alert alert-info alert-dismissable">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <strong><?= $this->lang->line('error') ?>!</strong> <?php echo isset($error_message) ? $error_message : $this->session->flashdata('invalid'); ?>
                    </div>

                <?php } ?>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card alert">

                            <div class="card-body">
                                <div class="menu-upload-form">

                                    <form class="form-horizontal" action="<?= CATEGORY_PATH ?>/add" method="post" accept-charset="utf-8" id="addCategory" enctype="multipart/form-data">

                                        <div class="form-group">
                                            <label class="col-sm-3 control-label"><?= $this->lang->line('title') ?>:</label>
                                            <div class="col-sm-9">
                                                <input id="title" class="form-control required" type="text" name="title" placeholder="<?= $this->lang->line('enter_title') ?>" value="<?= set_value('title') ?>">
                                                <?= form_error('title'); ?>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label"><?=$this->lang->line('image')?>:</label>
                                                <div class="col-sm-10">
                                                    <div class="form-control file-input dark-browse-input-box">
                                                        <label for="inputFile-2">
                                                            <span class="btn btn-danger dark-input-button image-custom">

                                                                <input type="file" name="image" id="inputFile-2" onchange="validateImage()">
                                                                <i class="fa fa-file-archive-o"></i>
                                                                <div class="row fileuploadvalid">
                                                                </div>
                                                            </span>
                                                        </label>
                                                        <input class="file-name input-flat" type="text" readonly="readonly" placeholder="<?=$this->lang->line('upload_image')?>">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-3 col-sm-9">
                                                <button type="submit" class="btn btn-lg btn-primary"><?= $this->lang->line('add') ?></button>
                                                <a href="javascript:void(0)" onclick="window.history.go(-1); return false;" class="btn btn-lg btn-danger"><?= $this->lang->line('cancel') ?></a>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div><!-- /# card -->
                    </div><!-- /# column -->
                </div><!-- /# row -->
            </div><!-- /# main content -->
        </div><!-- /# container-fluid -->
    </div><!-- /# main -->
</div><!-- /# content wrap -->
<?php
include(ADMIN_INCLUDE_PATH . '/footer.php'); ?>

<script type="text/javascript">
    function validateImage() {
        var formData = new FormData();

        var file = document.getElementById("inputFile-2").files[0];


        formData.append("Filedata", file);
        var t = file.type.split('/').pop().toLowerCase();
        if (t != "jpeg" && t != "jpg" && t != "png" && t != "bmp" && t != "gif") {
            $('.fileuploadvalid').css("display", "block");
            $('.image-custom label').css("display", "none");

            $('.fileuploadvalid').text('Accepted extensions are jpg, jpeg, png, gif,bmp');
            $('.fileuploadvalid').css("position", "absolute");
            $('.fileuploadvalid').css("top", "32px");
            $('.fileuploadvalid').css("float", "left");
            $('.fileuploadvalid').css("left", "-550px");
            $('.fileuploadvalid').css("font-weight", "400");
            $('.fileuploadvalid').css("font-size", "14px");
            document.getElementById('inputFile-2').value = '';
            $('.file-name').val('');


            return false;



        } else {
            var x = document.getElementById("inputFile-2").value;
            $('.file-name').val(x);
            $('.fileuploadvalid').css("display", "none");
            $('.image-custom label').css("display", "none");
        }


        return true;
    }

    $('form').each(function() {
        $(this).submit(function(e) {
            var x = document.getElementById("inputFile-2").value;

            if (x == '') {
                $('.fileuploadvalid').css("display", "block");
                $('.image-custom label').css("display", "none");
                e.preventDefault();

                return false;
            }

        })
    })
</script>


<?php
include(ADMIN_INCLUDE_PATH . '/close.php');
?>