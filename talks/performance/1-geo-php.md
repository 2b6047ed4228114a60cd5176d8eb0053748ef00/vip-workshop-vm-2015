# Performance
## geo.php
### VIP Workshop 2015

---

## Problem

This thing doesn't scale.

---

## Solution(?)

Find new developers ;)

---

## Solution

Add moar servers.

or

Fix the application.

Note:
Servers are just a stopgap.

---

## Problem

Setting cookie on every pageload

```
if ( isset( $_COOKIE['pbe_user_location'] ) ) {
	pbe_set_user_location( $_COOKIE['pbe_user_location'] );
}
```

Makes it alot harder to implement full-page caching.

Note:
This is a common and easy-to-create problem. Prefer re-usability/utility of code over performance costs.

---

## Solution

Don't cookie users with cookies.

### Bonus

Long cookie expiry + extend cookie expiry every day (js)

Note:
Would require some tricky logic but possible to do.

---

## Problem

Location detection relies on an external service so we're now reliant on a 3rd party

---

## Solution

* Fetch on the front-end directly from the API.
* Or, Make sure the API is super fast and super reliable
* Or, Do it at the server-level and inject into the request (i.e. `$_SERVER['GEO_IP_CODE']`)

---

## Sub-problem

VIP wants more granular location or do selective locations.

Note:
Granular data might not be available at the server.

Example: Want all visitors from California, Washington, and Oregon into NW-US "region".

---

## Sub-solution

Move to front-end but requires page refresh (bad) or compromise.

Note:
JS very early in the pageload pings an external API, sets cookie, and refreshes page so we get personalized data.

Every new visitor needs a refresh which is one request more than we want. We could use a cache variant to serve a dummy page to those users but leave behind non-js users.

Only do it on the homepage?
Drop personalization.

---

## Problem

Personalization by location.

Makes it alot harder to implement full-page caching.

Note:
Showing weather and local widget which vary by location.

---

## Solution(s)

* Fetch on front-end directly via API.
* Strip away personalized pieces and load async (use AJAX/iframes for personal widgets).
* Cache variants.

---

## Problem

Location fetching and cookie lookup happens on `init` (including admin pageloads).

This is a waste (even though it's speedy).

---

## Solution

Use a better front-end-only hook.

---

## Problem

Weather lookup does a database write when cache is empty.

Note:
This is very bad for cache misses (stampede).

Writes are way more expensive than reads.

---

## Solution

* Less frequent refreshes.
* Really, really good locking.
* Generate async instead (via cron).

---

## Problem

Weather lookup does not cache failures.

---

## Solution

Cache the failures :)

### Bonus

Fallback + exponential backoff

---

## Problem

Local news query does some potentially messy queries.

---

## Solution

Many options here:

* Remove :)
* Improve the query: `post__not_in` instead of `category__not_in`
* Generate async and cache/store IDs
* ES
