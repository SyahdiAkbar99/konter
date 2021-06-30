<!-- Footer -->
<footer class="sticky-footer bg-white">
    <div class="container my-auto">
        <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2021</span>
        </div>
    </div>
</footer>
<!-- End of Footer -->

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Yakin Ingin Keluar?</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">Pilih "Logout" dibawah jika kamu yakin untuk mengakhiri session saat ini.</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                <a class="btn btn-primary" href="<?= base_url('auth/logout'); ?>">Logout</a>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="<?= base_url('assets/admin/js/jquery.min.js') ?>"></script>
<script src="<?= base_url('assets/admin/js/bootstrap.bundle.min.js') ?>"></script>

<!-- Core plugin JavaScript-->
<script src="<?= base_url('assets/admin/js/jquery.easing.min.js') ?>"></script>

<!-- Custom scripts for all pages-->
<script src="<?= base_url('assets/admin/js/sb-admin-2.min.js') ?>"></script>

<!-- Page level plugins -->
<script src="<?= base_url('assets/admin/js/Chart.min.js') ?>"></script>

<!-- Datatables Online -->
<!-- Datatables -->
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.bootstrap4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.colVis.min.js"></script>

<script>
    $('.custom-file-input').on('change', function() {
        let fileName = $(this).val().split('\\').pop();
        $(this).next('.custom-file-label').addClass("selected").html(fileName);
    })
</script>

<!-- Page level custom scripts -->
<script src="<?= base_url('assets/admin/js/chart-area-demo.js') ?>"></script>
<script type="text/javascript">
    //Button Export Data Tanaman Menu
    $(document).ready(function() {
        $('#data-users').DataTable({
            dom: 'lfrtip',
            autoWidth: true,
            lengthMenu: [
                [5, 10, 25, 50, -1],
                [5, 10, 25, 50, "All"]
            ],
            buttons: [{
                    className: 'btn-danger btn-round btn-sm mr-2',
                    extend: 'pdfHtml5',
                    text: 'Cetak (PDF) <i class="fa fa-file-pdf-o"></i>',
                    exportOptions: {
                        columns: [0, 1, 2, 4, 5, 6, 7, 8, 9],
                    },
                    title: 'Data Tanaman'
                },
                {
                    className: 'btn-success btn-round btn-sm mr-2',
                    extend: 'excelHtml5',
                    text: 'Cetak (Excel) <i class="fa fa-file-excel-o"></i>',
                    exportOptions: {
                        columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
                    },
                    title: 'Data Tanaman'
                }
            ],
            select: {
                style: "multi"
            }
        });
    });

    var ctx = document.getElementById('myChart').getContext('2d');
    var chart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: [
                <?php
                if (count($transaction) > 0) {
                    foreach ($transaction as $data) {
                        echo "'" . $data->kode . "',";
                    }
                }
                ?>
            ],
            datasets: [{
                label: 'Total Transaksi',
                backgroundColor: '#ADD8E6',
                borderColor: '##93C3D2',
                data: [
                    <?php
                    if (count($transaction) > 0) {
                        foreach ($transaction as $data) {
                            echo $data->total_transaksi . ", ";
                        }
                    }
                    ?>
                ]
            }]
        },
    });
</script>
</body>

</html>