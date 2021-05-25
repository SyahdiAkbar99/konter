<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

        <div class="col-xl-8 col-lg-12 col-md-9">

            <div class="card o-hidden border-0 border-bottom-danger shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <p class=""><?= $this->session->flashdata('message') ?></p>
                        </div>
                        <div class="col-lg-12">
                            <div class="p-4">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4"><?= $title; ?></h1>
                                </div>
                                <form action="<?= base_url('auth/registration'); ?>" method="POST" class="user">
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">(...)</div>
                                            </div>
                                            <input type="text" class="form-control form-control-user" name="name" id="name" value="<?= set_value('name') ?>" placeholder="Masukkan Nama">
                                        </div>
                                        <?= form_error('name', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">@</div>
                                            </div>
                                            <input type="email" class="form-control form-control-user" name="email" id="email" value="<?= set_value('email') ?>" placeholder="Masukkan Email">
                                        </div>
                                        <?= form_error('email', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa fa-key"></i></div>
                                            </div>
                                            <input type="password" class="form-control form-control-user" name="password1" id="password1" placeholder="Masukkan Password">
                                        </div>
                                        <?= form_error('password1', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa fa-key"></i></div>
                                            </div>
                                            <input type="password" class="form-control form-control-user" name="password2" id="password2" placeholder="Ulangi Password">
                                        </div>
                                        <?= form_error('password2', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text">+62</div>
                                            </div>
                                            <input type="tel" class="form-control form-control-user" name="no_telp" id="no_telp" value="<?= set_value('no_telp') ?>" placeholder="Masukkan No Telpon">
                                        </div>
                                        <?= form_error('no_telp', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <label for="alamat">Alamat</label>
                                        <textarea class="form-control" name="alamat" id="alamat" cols="30" rows="3"><?= set_value('alamat') ?></textarea>
                                        <?= form_error('alamat', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa fa-users"></i></div>
                                            </div>
                                            <select name="role_id" class="form-control" id="role_id">
                                                <?php foreach ($role_id as $rid) : ?>
                                                    <?php if ($rid['id'] == 1) : ?>
                                                    <?php else : ?>
                                                        <option value="<?= $rid['id'] ?>"><?= $rid['role']; ?></option>
                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <?= form_error('role_id', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa fa-credit-card"></i></div>
                                            </div>
                                            <input type="text" class="form-control form-control-user" name="no_rekening" id="no_rekening" value="<?= set_value('no_rekening') ?>" placeholder="Masukkan No Rekening">
                                        </div>
                                        <?= form_error('no_rekening', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group mb-2">
                                            <div class="input-group-prepend">
                                                <div class="input-group-text"><i class="fa fa-piggy-bank"></i></div>
                                            </div>
                                            <input type="text" class="form-control form-control-user" name="nama_bank" id="nama_bank" value="<?= set_value('nama_bank') ?>" placeholder="Masukkan Nama Bank">
                                        </div>
                                        <?= form_error('nama_bank', '<small class="text-danger pb-3">', '</small>'); ?>
                                    </div>
                                    <button type="submit" class="btn btn-info btn-user btn-block">
                                        Daftar
                                    </button>
                                </form>
                                <hr>
                                <div class="text-center pb-4">
                                    <a class="small" href="<?= base_url('auth') ?>">Loginnya Disini!</a>
                                </div>
                                <form class="user">
                                    <div class="card o-hidden border-0">
                                        <small class="text-warning">
                                            <i class="fa fa-exclamation-circle"></i>
                                            Jika mendaftar sebagai pembeli, isi rekeing dengan angka "0" atau "-" dan isi Nama Bank "Kosong".
                                        </small>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>

</div>