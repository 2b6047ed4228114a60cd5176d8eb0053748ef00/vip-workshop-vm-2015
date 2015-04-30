<?php get_header(); ?>

	<section id="primary" class="content-area">
		<main id="main" class="site-main" role="main">

		<?php $national_query = new WP_Query( array( 'category_name' => 'national' ) ); ?>
		<?php if ( $national_query->have_posts() ) : ?>
			<header class="entry-header">
				<h1 class="entry-title">National News</h1>
			</header>

			<?php
			while ( $national_query->have_posts() ) : $national_query->the_post();
				get_template_part( 'content', 'slim' );
			endwhile;

			wp_reset_postdata();
		endif;
		?>

		<?php $user_location = pbe_get_user_location(); ?>
		<?php if ( 'National' !== $user_location ) : ?>
			<?php
			$local_cat = get_category_by_slug( $user_location );
			$national_cat = get_category_by_slug( 'national' );
			$local_query = new WP_Query( array( 'category__in' => $local_cat->term_id, 'category__not_in' => $national_cat->term_id ) );
			?>
			<?php if ( $local_query->have_posts() ) : ?>
				<header class="entry-header">
					<h1 class="entry-title">Local News</h1>
				</header>

				<?php
				while ( $local_query->have_posts() ) : $local_query->the_post();
					get_template_part( 'content', 'slim' );
				endwhile;

				wp_reset_postdata();
			endif;
			?>
		<?php endif; ?>

		</main><!-- .site-main -->
	</section><!-- .content-area -->

<?php get_footer(); ?>
