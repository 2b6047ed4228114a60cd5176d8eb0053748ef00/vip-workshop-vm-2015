<?php
/**
 * The base configurations of the WordPress.
 *
 * This file has the following configurations: MySQL settings, Table Prefix,
 * Secret Keys, and ABSPATH. You can find more information by visiting
 * {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php}
 * Codex page. You can get the MySQL settings from your web host.
 *
 * This file is used by the wp-config.php creation script during the
 * installation. You don't have to use the web site, you can just copy this file
 * to "wp-config.php" and fill in the values.
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'rest_api');

/** MySQL database username */
define('DB_USER', 'username');

/** MySQL database password */
define('DB_PASSWORD', 'password');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '/J(_J|,N3MO?MDu<&oS5?Zdra:ynMcaFQS`P|<D(a|-YQy;CIc)~:kSeV]IE+7~`');
define('SECURE_AUTH_KEY',  'F@VAd:A78u|kSj[g:R6wPt$45|+/IDVE}xOg43[lJbw9v,m2%}izS@sTyFy}B!&Y');
define('LOGGED_IN_KEY',    'aADRu-z/_clUJZ-<]SB`^;px>NNdYtf`i1Y1*f`98~OR8Z4?NW!>e2ER5p{CLH|[');
define('NONCE_KEY',        ';3]+,Ru:7Yf16`^Noya>XZikeDX>!x%)U?P=]Q,uU;^aZB@ZA%fcf{/c.x@MabF3');
define('AUTH_SALT',        'q*iUII{WVIYMg?OQaGp?U.pMH9F$5kGsn#JV-+?P).M2K^#Yk7[zp 2*L?4W;j!E');
define('SECURE_AUTH_SALT', '[>[x:5!E1gS)wm87GZ!`tj.IClo3#C&mgUKM)N-/kj&c@%+/V_L;&+X4@[Z;:wLq');
define('LOGGED_IN_SALT',   'X_,+KTl!Z/$pk#;lx!w>-REEj_Kc]s-s.-q>hf-~g3ScV|z#FyHL/=QnskJAd]rv');
define('NONCE_SALT',       '_!/sDNJXm+]mjt3VB+jpBJa{L?UQm$VJ#+PJ/2Ak~|^Ps}Hg+;T{S;+QOQC$.A3!');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'fishing_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
