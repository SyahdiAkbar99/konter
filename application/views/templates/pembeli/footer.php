<!-- Footer -->
<footer class="bg3 p-t-75 p-b-32">
    <div class="container">
        <div class="p-t-40">
            <p class="stext-107 cl6 txt-center">
                Copyright &copy;<script>
                    document.write(new Date().getFullYear());
                </script> All rights reserved
            </p>
        </div>
    </div>
</footer>


<!-- Back to top -->
<div class="btn-back-to-top" id="myBtn">
    <span class="symbol-btn-back-to-top">
        <i class="zmdi zmdi-chevron-up"></i>
    </span>
</div>

<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/jquery-3.2.1.min.js'); ?>"></script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/animsition.min.js'); ?>"></script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/popper.js'); ?>"></script>
<script src="<?= base_url('assets/user/js/bootstrap.min.js'); ?>"></script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/select2.min.js') ?>"></script>
<script>
    $(".js-select2").each(function() {
        $(this).select2({
            minimumResultsForSearch: 20,
            dropdownParent: $(this).next('.dropDownSelect2')
        });
    })
</script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/moment.min.js'); ?>"></script>
<script src="<?= base_url('assets/user/js/daterangepicker.js'); ?>"></script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/slick.min.js'); ?>"></script>
<script src="<?= base_url('assets/user/js/slick-custom.js'); ?>"></script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/parallax100.js'); ?>"></script>
<script>
    $('.parallax100').parallax100();
</script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/jquery.magnific-popup.min.js'); ?>"></script>
<script>
    $('.gallery-lb').each(function() { // the containers for all your galleries
        $(this).magnificPopup({
            delegate: 'a', // the selector for gallery item
            type: 'image',
            gallery: {
                enabled: true
            },
            mainClass: 'mfp-fade'
        });
    });
</script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/isotope.pkgd.min.js'); ?>"></script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/sweetalert.min.js'); ?>"></script>
<script>
    $('.js-addwish-b2').on('click', function(e) {
        e.preventDefault();
    });

    $('.js-addwish-b2').each(function() {
        var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
        $(this).on('click', function() {
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-b2');
            $(this).off('click');
        });
    });

    $('.js-addwish-detail').each(function() {
        var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

        $(this).on('click', function() {
            swal(nameProduct, "is added to wishlist !", "success");

            $(this).addClass('js-addedwish-detail');
            $(this).off('click');
        });
    });

    /*---------------------------------------------*/

    $('.js-addcart-detail').each(function() {
        var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
        $(this).on('click', function() {
            swal(nameProduct, "is added to cart !", "success");
        });
    });
</script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/perfect-scrollbar.min.js'); ?>"></script>
<script>
    $('.js-pscroll').each(function() {
        $(this).css('position', 'relative');
        $(this).css('overflow', 'hidden');
        var ps = new PerfectScrollbar(this, {
            wheelSpeed: 1,
            scrollingThreshold: 1000,
            wheelPropagation: false,
        });

        $(window).on('resize', function() {
            ps.update();
        })
    });
</script>
<!--===============================================================================================-->
<script src="<?= base_url('assets/user/js/main.js'); ?>"></script>
<script type="text/javascript">
    $(document).on("keydown", "#no_telp", function(e) {
        let keycode = e.keyCode || e.which;
        let teks = $(this).val();
        if (teks.length < 1) {
            if (keycode == 48) {
                return false;
            } else {
                return true;
            }
        } else {
            return true;
        }
    });

    $(document).ready(function() {
        var url = window.location;
        $('ul.main-menu a[href="' + url + '"]').parent().addClass('active-menu');
        $('ul.main-menu a').filter(function() {
            return this.href == url;
        }).parent().addClass('active-menu');
    });

    // $(document).ready(function() {
    //     var url = window.location;
    //     $('ul.main-menu a[href="' + url + '"]').parent().addClass('color-filter9');
    //     $('ul.main-menu a').filter(function() {
    //         return this.href == url;
    //     }).parent().addClass('color-filter9');
    // });
</script>
</body>

</html>