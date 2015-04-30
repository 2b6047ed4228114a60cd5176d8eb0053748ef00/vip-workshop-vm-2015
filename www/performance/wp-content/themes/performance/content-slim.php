<article id="post-<?php the_ID(); ?>">
	<?php twentyfifteen_post_thumbnail(); ?>

	<header class="entry-header" style="padding: 10px; margin: 0 10%; border-bottom: 1px dotted #333; background: #fff; ">
		<?php the_title( sprintf( '<h2><a href="%s" style="display:block;">', esc_url( twentyfifteen_get_link_url() ) ), '</a></h2>' );
		?>
	</header>
	<!-- .entry-header -->

</article>
