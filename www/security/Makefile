all: able

able:
	wp --info &> /dev/null
	git --version &> /dev/null
	phantomjs --version &> /dev/null
	php -r 'if ( ! function_exists( "imagettfbbox" ) ) exit( 1 );'
	php -r 'if ( ! function_exists( "imagecreatetruecolor" ) ) exit( 1 );'

db:
	-@read -p 'Create `security` Database and Import `evil_*` Data? [y/N]: '; case "$$REPLY" in [yY]*) make unsafeimport ;; *) echo Aborted; exit 1 ;; esac

linkedlist:
	.db/linkedlist.sh 0-open-redirect 1-csrf 2-xss 8-sql-injection 13-logic-errors 11-os-injection 7-clickjacking 3-xss-js 4-xss-css 5-csrf-again 9-create-function 10-preg-replace 12-xxe 14-md5 15-configuration 16-the-end

unsafeimport: .db/db.sql
	-wp db create
	wp db import .db/db.sql
	wp db import .db/posts.sql

export:
	mysqldump --no-defaults --user=root --password=root --result-file=.db/db.sql security --tables evil_commentmeta evil_comments evil_links evil_options evil_postmeta evil_term_relationships evil_term_taxonomy evil_terms evil_usermeta evil_users evil_recent_colors
	mysqldump --no-defaults --user=root --password=root --result-file=.db/posts.sql security --tables evil_posts --where 'post_type<>"revision"'
	cat .db/db.sql .db/posts.sql > .db/security.sql
