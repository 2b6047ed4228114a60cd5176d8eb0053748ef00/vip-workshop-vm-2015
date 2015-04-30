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
define('AUTH_KEY',         '][2KC~N$al*1d8Mfwr:+tWpu(+#+YI +i6Us --fj9m@EQ1eG.5~Oe{vIi*-4Ml|');
define('SECURE_AUTH_KEY',  'Va<icnq^po7g _VBY}zZ,-)3}Y:kXHUJ=,kxB,BX)#/Od3%W2Ug{V>A)q^hLIr-9');
define('LOGGED_IN_KEY',    '7iZNO-!D-4{XTS[-%o?2PU)U+jyDWsd Mn%1T|>oL>4t=nY6-S?:lyv@~@ T`sI9');
define('NONCE_KEY',        'OXaQJw2_cBz6Blo}R_b^yIMrL5+T6M^HQ@%j^eE-^e@ZO`W%Z:>{OtJ24Nz?tc]1');
define('AUTH_SALT',        'aqku{I3}@s8|IU60z(!%xQXw&c;HsS?lXdc<XabeaM57QmtT#ebg7 IDVM`HN*Rs');
define('SECURE_AUTH_SALT', 'J.gw0+698P&Qin&ev>;4DN%+4+x^leoJU%RyrQ[g~d!cr2dbtt?7x_ZR5w=B5r`m');
define('LOGGED_IN_SALT',   '[Nc@WqVkcMcY76MO}-2&(~cCCm3}fkq&bU@zNAf6!_1Fk|oMP%R&PU0/Dj|WdIFd');
define('NONCE_SALT',       'Q=J`+un4vnbTh|UzvMB8ILY3pV.*+b.^xpJg)De{9X!LC{%31S?$CFd[QR-+|va7');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each a unique
 * prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'mma_';

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
