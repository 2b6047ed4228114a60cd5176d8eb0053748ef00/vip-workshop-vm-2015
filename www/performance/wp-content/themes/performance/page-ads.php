<?php
/**
 * Template name: Ads
 */
get_header(); ?>

	<div id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

			<?php
				$query = new WP_Query( array( 'posts_per_page' => 10 ) );
				$index = 0;
				// Start the Loop.
				while ( $query->have_posts() ) : $query->the_post();
					$index++;

					if ( function_exists( 'pbe_show_ad' ) && 0 === $index % 3 ) {
						pbe_show_ad( 'id-' . $index, $index, '300x250' );
					}

					get_template_part( 'content', get_post_format() );

				endwhile;
				wp_reset_postdata();
			?>

		</main><!-- .site-main -->
	</div><!-- .content-area -->

<?php
get_footer();
