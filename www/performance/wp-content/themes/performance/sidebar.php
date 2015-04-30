<?php if ( ! is_page( 'stampede' ) ) : ?>
	<div id="secondary" class="secondary">
		<div id="widget-area" class="widget-area" role="complementary">
			<?php get_template_part( 'templates/location-select' ); ?>
			<?php get_template_part( 'templates/location-weather' ); ?>
		</div>
	</div>
<?php endif; ?>
