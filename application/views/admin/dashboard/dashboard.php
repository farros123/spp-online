<div class="col-md-12 col-sm-12 col-xs-12 main post-inherit">
    <div class="x_panel post-inherit">

        <!-- Indicates a successful or positive action -->

        <div class="strong">
            <h1>Selamat Datang di Halaman Administrator</h1>
			<strong><?php echo $this->session->userdata('username'); ?> (<?php echo $this->session->userdata('nama_lengkap'); ?>) </strong>
			<br>
			<?php echo pretty_date(date('Y-m-d'), 'l, d F Y',FALSE) ?>
		</div>
		<br><br><br>
		<div class="col-md-3 col-md-offset-2">
			<div class="wBlock green clearfix">
				<div class="dSpace">
					<?php
					$ttl_msk = null;
					foreach ($total_spp as $row) {
						$ttl_msk = $ttl_msk+$row['total_biaya'];
					}
					foreach ($total_bangun as $row) {
						$ttl_msk = $ttl_msk+$row['jmlh_byr'];
					}
					?>
				<h3><b>Jumlah Pemasukan</b></h3>
					<span class="mChartBar" sparkType="bar" sparkBarColor="white"></span>
					<span class="number">Rp. <?php echo $ttl_msk;?></span>
				</div>
			</div>
		</div>

		<div class="col-md-3 col-md-offset-2">
			<div class="wBlock red clearfix">
				<div class="dSpace">
					<?php
					$ttl_keluar = null;
					foreach ($total_keluar as $row) {
						$ttl_keluar = $ttl_keluar+$row['biaya'];
					}

					?>
				<h3><b>Jumlah Pengeluaran</b></h3>
					<span class="mChartBar" sparkType="bar" sparkBarColor="white"></span>
					<span class="number">Rp. <?php echo $ttl_keluar;?></span>
				</div>

			</div>
		</div>


	</div>


</div>

