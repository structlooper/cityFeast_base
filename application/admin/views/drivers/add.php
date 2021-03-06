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
                            <h1><?=$this->lang->line('drivers')?></h1>
                        </div>
                    </div>
                </div><!-- /# column -->
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-right">
                                <li><a href="<?= DASHBOARD_PATH ?>"><?=$this->lang->line('dashboard')?></a></li>
                                <li><a href="<?= DRIVERS_PATH ?>"><?=$this->lang->line('driver_list')?></a></li>
                                <li><a class="active" href="javascript:void(0)"><?=$this->lang->line('add_driver')?></a></li>
                            </ol>
                        </div>
                    </div>
                </div><!-- /# column -->
            </div><!-- /# row -->

            <div class="main-content">
                <?php if (isset($error_message) && $error_message != '') { ?>

                    <div class="alert alert-danger alert-settings">
                        <ul class="error-message">
                            <li> <?= isset($error_message) ? $error_message : $this->session->flashdata('invalid'); ?> </li>
                        </ul>
                    </div>

                <?php } ?>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card alert">
                            
                            <div class="card-body">
                                <div class="menu-upload-form">

                                    <form class="form-horizontal" action="<?=DRIVERS_PATH ?>/add" method="post" accept-charset="utf-8" id="addOwner" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('full_name') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="fullname" class="form-control required" type="text" name="fullname" placeholder="<?= $this->lang->line('enter_name') ?>" value="<?= set_value('fullname') ?>">
                                                        <?= form_error('fullname'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('email_id') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="email_id" class="form-control required" type="text" name="email_id" placeholder="<?= $this->lang->line('enter_email_id') ?>" value="<?= set_value('email_id') ?>">
                                                        <?= form_error('email_id'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('phone_number') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="phone_number" class="form-control required" type="text" name="phone_number" placeholder="<?= $this->lang->line('enter_phone_number') ?>" value="<?= set_value('phone_number') ?>">
                                                        <?= form_error('phone_number'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('password') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="password" class="form-control required" type="password" name="password" placeholder="<?= $this->lang->line('enter_password') ?>" value="<?= set_value('password') ?>">
                                                        <?= form_error('password'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('birthdate') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="date_of_birth" class="form-control required" type="date" name="date_of_birth" placeholder="<?= $this->lang->line('enter_birthdate') ?>" value="<?= set_value('date_of_birth') ?>">
                                                        <?= form_error('date_of_birth'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('gender') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <label class="customRadio"><?= $this->lang->line('male') ?>
                                                            <input type="radio" name="gender" value="Male" checked>
                                                            <span class="checkmark"></span>
                                                        </label>
                                                        <label class="customRadio"><?= $this->lang->line('female') ?>
                                                            <input type="radio" name="gender"   value="Female">
                                                            <span class="checkmark"></span>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('country') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <select class="form-control required" name="country_id" id="country_id">

                                                            <option value=""><?= $this->lang->line('select_country') ?></option>
                                                            <?php
                                                            foreach ($country as $row) { ?>
                                                                <option <?=set_value('country_id')==$row['id']?"selected":""?> value="<?= $row['id']; ?>"><?= urldecode($row['name']); ?></option>
                                                            <?php } ?>
                                                        </select>
                                                        <?= form_error('country_id'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('state') ?>:</label>
                                                    <div class="col-sm-8" id="change_state">
                                                        <select class="form-control required" name="state_id" id="state_id">

                                                            <option value=""><?= $this->lang->line('select_state') ?></option>
                                                           
                                                        </select>
                                                        <?= form_error('state_id'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('city') ?>:</label>
                                                    <div class="col-sm-8" id="change_city">
                                                        <select class="form-control required" name="city_id" id="city_id">

                                                            <option value=""><?= $this->lang->line('select_city') ?></option>
                                                            
                                                        </select>
                                                        <?= form_error('city_id'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('pincode') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="pincode" class="form-control required" type="text" name="pincode" placeholder="<?= $this->lang->line('enter_pincode') ?>" value="<?= set_value('pincode') ?>">
                                                        <?= form_error('pincode'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label"><?= $this->lang->line('address') ?>:</label>
                                                    <div class="col-sm-10">
                                                        <textarea id="address" class="form-control required" name="address" placeholder="<?= $this->lang->line('enter_address') ?>"><?= set_value('address') ?></textarea>
                                                        <?= form_error('address'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('identity_number') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="identity_number" class="form-control required" type="text" name="identity_number" placeholder="<?= $this->lang->line('enter_identity_number') ?>" value="<?= set_value('identity_number') ?>">
                                                        <?= form_error('identity_number'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('identity_image') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="identity_image" class="form-control required" type="file" name="identity_image" placeholder="<?= $this->lang->line('upload_identity_image') ?>">
                                                        <?= form_error('identity_image'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('license_number') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="license_number" class="form-control required" type="text" name="license_number" placeholder="<?= $this->lang->line('enter_license_number') ?>" value="<?= set_value('license_number') ?>">
                                                        <?= form_error('license_number'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="col-sm-4 control-label"><?= $this->lang->line('license_image') ?>:</label>
                                                    <div class="col-sm-8">
                                                        <input id="license_image" class="form-control required" type="file" name="license_image" placeholder="<?= $this->lang->line('upload_license_image') ?>">
                                                        <?= form_error('license_image'); ?>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <div class="col-sm-offset-3 col-sm-9">
                                                        <button type="submit" class="btn btn-lg btn-primary"><?= $this->lang->line('add') ?></button>
                                                        <a href="javascript:void(0)" onclick="window.history.go(-1); return false;" class="btn btn-lg btn-danger"><?= $this->lang->line('cancel') ?></a>
                                                    </div>
                                                </div>
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
include(ADMIN_INCLUDE_PATH . '/footer.php');  ?>
<script type="text/javascript">
    $(document).on('change', '#country_id', function() {
        var country_id = $(this).val();
        $('#state_id').val("");
        $('#city_id').val("");
        $.ajax({
            type: "POST",
            url: "<?= DRIVERS_PATH ?>/getState",
            data: {
                'country_id': country_id
            },
            success: function(data) {
                $('#state_id').html(data);
            }
        });
    })

    $(document).on('change', '#state_id', function() {
        var state_id = $(this).val();
        $('#city_id').val("");
        $.ajax({
            type: "POST",
            url: "<?= DRIVERS_PATH ?>/getCity",
            data: {
                'state_id': state_id
            },
            success: function(data) {
                $('#city_id').html(data);
            }
        });
    })
</script>
<?php
include(ADMIN_INCLUDE_PATH . '/close.php');
?>